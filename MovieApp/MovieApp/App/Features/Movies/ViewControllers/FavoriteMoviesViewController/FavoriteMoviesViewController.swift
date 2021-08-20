import UIKit
import Combine

class FavoriteMoviesViewController: UIViewController {
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<SectionEnum, MovieViewModel>
    typealias DataSource = UICollectionViewDiffableDataSource<SectionEnum, MovieViewModel>
    
    let defaultOffset = 18
    let cellGroupHeightDifference = CGFloat(35)
    let cellHeight = CGFloat(154)
    var cellWidth: CGFloat {
        (view.safeAreaLayoutGuide.layoutFrame.width - CGFloat(2 * defaultOffset)) / 3
    }
    
    var titleLabel: UILabel!
    var collectionView: UICollectionView!
    
    var layout: UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(cellWidth),
            heightDimension: .absolute(cellHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(cellHeight + cellGroupHeightDifference))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
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
            .sink { [weak self] movies in
                self?.updateSnapshot(with: movies)
            }.store(in: &disposables)
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
