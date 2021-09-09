import UIKit
import Kingfisher
import Combine

class CategoryTableViewCell: UITableViewCell {

    private typealias DataSource = UICollectionViewDiffableDataSource<SectionEnum, MovieViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieViewModel>

    static let reuseIdentifier = String(describing: CategoryTableViewCell.self)

    let defaultOffset = 18
    let secondaryOffset = 8
    let scrollHeight = 22
    let collectionViewHeight = 179
    let refreshCollectionViewOffset = CGPoint(x: -18, y: 0)

    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 122, height: 179)
        layout.minimumInteritemSpacing = 8
        return layout
    }()

    var titleLabel: UILabel!
    var scrollView: SubcategoryScrollView!
    var collectionView: UICollectionView!
    var category: MovieCategoryViewModel!

    var isMovieFavorited: ((Int) -> Void)!
    var getMoviesInSubcategory: ((MovieCategoryViewModel, SubcategoryViewModel)
                                 -> AnyPublisher<[MovieViewModel], Error>)!
    var showMovieDetails: ((Int) -> Void)!
    var updateFavoriteMovie: ((Int) -> Void)!

    private var disposables = Set<AnyCancellable>()
    private var dataSource: DataSource!
    weak private var delegate: HomeViewController?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        buildViews()
        makeDataSource()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populateCell(title: MovieCategoryViewModel, categories: [SubcategoryViewModel]) {
        category = title
        titleLabel.text = title.rawValue
        scrollView.setData(categories: categories)
    }

    func subcategoryPressed(subCategory: SubcategoryViewModel) {
        disposables.removeAll()
        collectionView.setContentOffset(refreshCollectionViewOffset, animated: true)
        getMoviesInSubcategory(category, subCategory)
            .sink { _ in
            } receiveValue: { [weak self] in
                self?.updateSnapshot(with: $0)
            }
            .store(in: &disposables)
    }

    private func makeDataSource() {
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { [self] collectionView, indexPath, model in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? MovieCollectionViewCell
                else {
                    return nil
                }

                cell
                    .contentView
                    .throttledTapGesture()
                    .sink { [weak self] _ in
                        guard let delegate = self?.delegate else { return }

                        delegate.showMovieDetails(with: model.id)
                    }
                    .store(in: &cell.disposables)

                cell
                    .ellipseImageView
                    .throttledTapGesture()
                    .sink { [weak self] _ in
                        guard let delegate = self?.delegate else { return }

                        delegate.updateFavoriteMovie(with: model.id)
                    }
                    .store(in: &cell.disposables)

                cell.setData(with: model)
                return cell
            })
    }

    private func updateSnapshot(with movies: [MovieViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func set(delegate: HomeViewController) {
        self.delegate = delegate
    }

}
