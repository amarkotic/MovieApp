import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    let temporaryCategoryArray = ["Streaming", "On TV", "For Rent", "In theaters", "Popular", "For rent"]
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let collectionViewCellWidth = 122
    let collectionViewCellHeight = 179
    let scrollHeight = 22

    var titleLabel: UILabel!
    
    var categoryScrollView: UIScrollView!
    var categoryStackView: UIStackView!
    var categoryArray = [SubcategoryView]()
    
    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        createButtons()
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons() {
        for i in 0..<temporaryCategoryArray.count {
            let titleView = SubcategoryView(frame: .zero)
            titleView.identifier = i
            if (titleView.identifier == 0) {
                titleView.select()
                titleView.isSelected = true
            }
            titleView.delegate = self
            titleView.isUserInteractionEnabled = true
            titleView.setData(title: temporaryCategoryArray[i])
            categoryArray.append(titleView)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImageCell.reuseIdentifier, for: indexPath) as? MovieImageCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setData(with: UIImage(with: .temporaryImage)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}



