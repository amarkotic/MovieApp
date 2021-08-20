import UIKit
import Combine

class FavoriteMoviesViewController: UIViewController {
    
    let defaultOffset = 18
    let cellHeight = CGFloat(154)
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 7
        layout.minimumLineSpacing = 35
        return layout
    }()
    
    var titleLabel: UILabel!
    var collectionView: UICollectionView!
    
    var movies = [MovieViewModel]()
    var presenter: FavoriteMoviesPresenter!
    var disposables = Set<AnyCancellable>()
    
    convenience init(presenter: FavoriteMoviesPresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        presenter.setDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter
            .favoriteMovies
            .sink { [weak self] movies in
                self?.reloadData(with: movies)
            }.store(in: &disposables)
    }
    
    func reloadData(with movies: [MovieViewModel]) {
        self.presenter.data = movies
        self.collectionView.reloadData()
    }
    
}

extension FavoriteMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier,
                for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        let data = presenter.data[indexPath.row]
        cell.setData(with: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.frame.width - 60) / 3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
