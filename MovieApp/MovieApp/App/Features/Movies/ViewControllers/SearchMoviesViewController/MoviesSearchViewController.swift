import UIKit
import Combine

class MoviesSearchViewController: UIViewController, UITextFieldDelegate {

    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieSearchViewModel>
    private typealias DataSource = UITableViewDiffableDataSource<SectionEnum, MovieSearchViewModel>

    let rowHeight: CGFloat = 142
    let defaultInset = 20
    let searchBarHeight = 43

    var searchBarStackView: SearchBarStackView!
    var logoImageView: UIImageView!
    var tableView: UITableView!

    private var disposables = Set<AnyCancellable>()
    private var dataSource: DataSource!
    private var presenter: MoviesSearchPresenter!

    convenience init(presenter: MoviesSearchPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        styleNavigationBar()
        setupSearchBar()
        makeDataSource()
        setupSearchListener()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        searchBarStackView.activateKeyboard()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }

    private func setupSearchListener() {
        searchBarStackView.searchBar.searchTextField
            .rxText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] in
                guard let self = self else { return }

                self.presenter.fetchSearchMovies(with: $0)
                    .sink { _ in }
                        receiveValue: { [weak self] in
                            self?.updateSnapshot(with: $0)
                        }
                    .store(in: &self.disposables)
            }
            .store(in: &disposables)
    }

    private func makeDataSource() {
        dataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, model in
                guard
                    let cell = tableView.dequeueReusableCell(
                        withIdentifier: MovieSearchCell.reuseIdentifier,
                        for: indexPath) as? MovieSearchCell
                else {
                    return nil
                }

                cell.populateCell(with: model)
                return cell
            }
        )
    }

    private func updateSnapshot(with movies: [MovieSearchViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    private func setupSearchBar() {
        searchBarStackView.searchBar.searchTextField.delegate = self
        searchBarStackView.cancelButton
            .publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.popViewController()
            }
            .store(in: &disposables)
    }

    private func styleNavigationBar() {
        navigationItem.hidesBackButton = true
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
    }

    @objc private func popViewController() {
        presenter.popViewController()
    }

}
