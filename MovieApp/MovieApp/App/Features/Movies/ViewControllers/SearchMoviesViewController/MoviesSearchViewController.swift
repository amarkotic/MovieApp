import UIKit

class MoviesSearchViewController: UIViewController {

    let rowHeight: CGFloat = 142

    var logoImageView: UIImageView!
    var tableView: UITableView!
    var movies = [MovieSearchViewModel]()

    private var presenter: MoviesSearchPresenter!

    convenience init(presenter: MoviesSearchPresenter) {
        self.init()
        
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setMoviesViewDelegate(moviesViewDelegate: self)
        presenter.fetchMovies()
        buildViews()
    }
    
    func fetchSuccesful(movies: [MovieSearchViewModel]) {
        self.movies = movies
        tableView.reloadData()
    }
    
}

extension MoviesSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
}

extension MoviesSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieSearchCell.reuseIdentifier) as? MovieSearchCell
        else {
            return UITableViewCell()
        }
        
        cell.populateCell(with: movies[indexPath.row])
        return cell
    }
    
}
