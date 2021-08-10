import UIKit
import Kingfisher

class CategoryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryTableViewCell.self)
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let scrollHeight = 22
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
    var movies = [MovieViewModel]()
    
    weak private var delegate: HomeViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateCell(title: MovieCategoryViewModel, categories: [SubcategoryViewModel], movies: [MovieViewModel]) {
        category = title
        titleLabel.text = title.rawValue
        scrollView.setData(categories: categories)
        self.movies = movies
        collectionView.reloadData()
    }
    
    func subcategoryPressed(subCategory: SubcategoryViewModel) {
        collectionView.setContentOffset(refreshCollectionViewOffset, animated: true)
        delegate?.subcategoryPressed(category: category, subCategory: subCategory)
    }
    
    func set(delegate: HomeViewController) {
        self.delegate = delegate
    }
    
    @objc private func movieTapped(_ sender: UITapGestureRecognizer) {
        guard let item = sender.view as? MovieCollectionViewCell else { return }
        if let id = item.identifier {
            delegate?.showMovieDetails(with: id)
        }
    }
 
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier,
                for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setData(with: movies[indexPath.row])
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(movieTapped)))
        return cell
    }
    
}



