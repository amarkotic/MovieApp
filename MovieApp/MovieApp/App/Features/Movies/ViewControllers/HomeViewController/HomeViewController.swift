import UIKit

class HomeViewController: UIViewController {
    
    let defaultInset = 20
    let searchBarHeight = 43
    let rowHeight = CGFloat(311)
    
    var searchBar: SearchBar!
    var tableView: UITableView!
    
    var presenter: HomePresenter!
    var reloadModel: ReloadModel?
    
    convenience init(presenter: HomePresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        presenter.setDelegate(delegate: self)
        presenter.initialFetch()
        searchBar.setDelegate(delegate: self)
        searchBar.searchTextField.addTarget(self, action: #selector(presentSearchViewController), for: .touchDown)
    }
    
    func subcategoryPressed(category: MovieCategoryViewModel, subCategory: SubcategoryViewModel) {
        reloadModel = ReloadModel(category: category, subCategory: subCategory)
        presenter.fetchMovies(category: category, subCategory: subCategory)
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showMovieDetails(with id: Int) {
        presenter.showMovieDetails(with: id)
    }
    
    func reloadFavoriteMovie() {
        guard
            let model = reloadModel
        else {
            presenter.initialFetch()
            return
        }

        presenter.fetchMovies(category: model.category, subCategory: model.subCategory)
        tableView.reloadData()
    }
    
    @objc private func presentSearchViewController() {
        presenter.presentSearchViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadFavoriteMovie()
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier) as? CategoryTableViewCell
        else {
            return CategoryTableViewCell()
        }
        
        cell.set(delegate: self)
        let data = presenter.data[indexPath.row]
        cell.isMovieFavorited = { [weak self] id in
            guard let self = self else { return }
            
            self.presenter.updateFavoriteMovie(with: id)
            self.reloadFavoriteMovie()
        }
        cell.populateCell(title: data.title, categories: data.categories, movies: data.movies)
        return cell
    }
    
}
