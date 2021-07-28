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
    
    
    var firstLoad = true
    var subcategories = [String]()
    
    var titleLabel: UILabel!
    var scrollView: SubcategoryScrollView!
    var collectionView: UICollectionView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populateCell(category: String, subcategories: [String]) {
        self.subcategories = subcategories
        titleLabel.text = category
        scrollView.populateCell(category: category, subcategories: subcategories)
        scrollView.setScrollViewDelegate(delegate: self)
    }
    
    func subcategoryPressed(identifier: Int, category: String) {
        print("You selected item n. \(identifier) from category: \(category)")
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier,
                                                          for: indexPath) as? MovieCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setData(with: UIImage(with: .temporaryImage)!)
        return cell
    }
    
}



