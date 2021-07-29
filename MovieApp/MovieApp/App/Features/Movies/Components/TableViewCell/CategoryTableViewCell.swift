import UIKit
import Kingfisher

class CategoryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryTableViewCell.self)
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let scrollHeight = 22
    
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
    
    var category: CategoryEnum!
    var movies = [MovieViewModel]()
    
    weak private var delegate: HomeViewController?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateCell(title: CategoryEnum, categories: [SubcategoryEnum], movies: [MovieViewModel]) {
        category = title
        titleLabel.text = title.rawValue
        scrollView.setData(categories: categories)
        self.movies = movies
        collectionView.reloadData()
    }
    
    func subcategoryPressed(subCategory: SubcategoryEnum) {
        delegate?.subcategoryPressed(category: category, subCategory: subCategory)
    }
    
    func set(delegate: HomeViewController) {
        self.delegate = delegate
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
        return cell
    }
    
}



