import UIKit
import Combine

class FavoriteMoviesViewController: UIViewController {

    private typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieViewModel>
    private typealias DataSource = UICollectionViewDiffableDataSource<SectionEnum, MovieViewModel>

    
    let defaultOffset = 18
    
    var titleLabel: UILabel!
    var collectionView: UICollectionView!
    
    private var presenter: FavoriteMoviesPresenter!
    private var disposables = Set<AnyCancellable>()
    private var dataSource: DataSource!
    
    convenience init(presenter: FavoriteMoviesPresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        makeDataSource()
        bindViews()
    }
    
    private func bindViews() {
        presenter
            .favoriteMovies
            .sink { [weak self] in
                self?.updateSnapshot(with: $0)
            }
            .store(in: &disposables)
    }
    
    private func makeDataSource() {
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: {collectionView, indexPath, model in
                guard
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? MovieCollectionViewCell
                else {
                    return nil
                }
                
                cell.setData(with: model)
                return cell
            }
        )
    }
    
    private func updateSnapshot(with movies: [MovieViewModel]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(movies)
        dataSource.apply(snapshot)
    }
    
}
