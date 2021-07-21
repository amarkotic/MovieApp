import UIKit

class MoviesViewController: UIViewController {

    let rowHeight: CGFloat = 142

    var logoImageView: UIImageView!
    var tableView: UITableView!
    var movies = [MovieViewModel]()

    private var presenter: MoviesPresenter!

    convenience init(presenter: MoviesPresenter) {
        self.init()
        
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setMoviesViewDelegate(moviesViewDelegate: self)
        presenter.fetchMovies()
        buildViews()
        buildNavigationBar()
    }
    
    func fetchSuccesful(movies: [MovieViewModel]) {
        self.movies = movies
        tableView.reloadData()
    }
    
}

extension MoviesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
    
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseIdentifier) as? MovieCell
        else {
            return UITableViewCell()
        }
        
        cell.populateCell(with: movies[indexPath.row])
        return cell
    }
    
}