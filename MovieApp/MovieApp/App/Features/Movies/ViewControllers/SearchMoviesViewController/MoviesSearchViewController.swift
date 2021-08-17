import UIKit

class MoviesSearchViewController: UIViewController, UITextFieldDelegate {

    let rowHeight: CGFloat = 142
    let defaultInset = 20
    let searchBarHeight = 43

    var searchBarStackView: SearchBarStackView!
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
        
        buildViews()
        styleNavigationController()
        presenter.setDelegate(delegate: self)
        searchBarStackView.setDelegate(delegate: self)
        searchBarStackView.searchBar.searchTextField.delegate = self
        searchBarStackView.searchBar.searchTextField.addTarget(self, action: #selector(queryMovies), for: .editingChanged)
        searchBarStackView.cancelButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchBarStackView.activateKeyboard()
    }

    func fetchSuccesful(movies: [MovieSearchViewModel]) {
        self.movies = movies
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        queryMovies()
        self.view.endEditing(true)
        return false
    }
    
    private func styleNavigationController() {
        navigationItem.hidesBackButton = true
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
    }
    
    @objc private func queryMovies() {
        guard let text = searchBarStackView.searchBar.searchTextField.text else { return }
        
        presenter.fetchMovies(with: text)
    }
    
    @objc private func popViewController() {
        presenter.popViewController()
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
