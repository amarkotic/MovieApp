import UIKit
import Combine

class HomeViewController: UIViewController {

    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieCategoryViewModel>
    private typealias DataSource = UITableViewDiffableDataSource<SectionEnum, MovieCategoryViewModel>

    let defaultInset = 20
    let searchBarHeight = 43
    let rowHeight = CGFloat(311)

    var searchBar: SearchBar!
    var tableView: UITableView!
    var presenter: HomePresenter!

    private var disposables = Set<AnyCancellable>()
    private var dataSource: DataSource!

    convenience init(presenter: HomePresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        setupSearchBar()
        makeDataSource()
    }

    func showMovieDetails(with id: Int) {
        presenter.showMovieDetails(with: id)
    }

    func updateFavoriteMovie(with model: MovieViewModel) {
        presenter
            .updateFavoriteMovie(with: model)
    }

    private func makeDataSource() {
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, model -> UITableViewCell? in
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: CategoryTableViewCell.reuseIdentifier,
                        for: indexPath) as? CategoryTableViewCell
                else {
                    return nil
                }

                cell.getMoviesInSubcategory = { [weak self] category, subcategory in
                    guard let self = self else { return .empty() }

                    return self.presenter.fetchMovies(category: category, subCategory: subcategory)
                }
                cell.set(delegate: self)
                cell.populateCell(title: model, categories: self.presenter.getSubcategories(for: model))
                return cell
            })
        updateSnapshot(with: [.popular, .topRated, .trending])
    }

    private func updateSnapshot(with categories: [MovieCategoryViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(categories)
        dataSource.apply(snapshot)
    }

    private func setupSearchBar() {
        searchBar.searchTextField.addTarget(self, action: #selector(goToSearch), for: .touchDown)
    }

    @objc private func goToSearch() {
        presenter
            .goToSearch()
    }

}
