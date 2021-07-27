import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let collectionViewCellWidth = 122
    let collectionViewCellHeight = 179
    let scrollHeight = 22
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 122, height: 179)
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    var titleLabel = UILabel()
    var categories = [String]()
    var categoryScrollView: UIScrollView!
    var categoryStackView: UIStackView!
    var categoryArray = [SubcategoryView]()
    var collectionView: UICollectionView!
    
    var firstLoad = true
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons() {
        for i in 0..<categories.count {
            let categoriesView = SubcategoryView(frame: .zero)
            categoriesView.delegate = self
            categoriesView.isUserInteractionEnabled = true
            categoriesView.identifier = i
            if (categoriesView.identifier == 0) {
                categoriesView.select()
            }
            categoriesView.setData(title: categories[i])
            categoryArray.append(categoriesView)
        }
        buildViews()
    }
    
    func populateCell(category: String, subcategories: [String]) {
        categories = subcategories
        titleLabel.text = category
        
        if(firstLoad){
            createButtons()
            firstLoad = false
        }
    }
    
    func update(with identifier: Int) {
        for item in categoryArray {
            if item.identifier != identifier {
                item.deselect()
            }
        }
    }
    
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImageCell.reuseIdentifier,
                                                          for: indexPath) as? MovieImageCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setData(with: UIImage(with: .temporaryImage)!)
        return cell
    }
    
}



