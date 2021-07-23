import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    
    var titleLabel: UILabel!
    var categoryScrollView: UIScrollView!
    var scrollContentView: UIView!
    var categoryStackView: UIStackView!
    var categoryArray = [UIButton]()
    
    var moviesScrollView: UIScrollView!
//    var moviesScrollContentView: UIView!
    var moviesStackView: UIStackView!
    var moviesArray = [UIImageView]()
    
    let temporaryCategoryArray = ["Streaming", "On TV", "For Rent", "In theaters", "Popular", "For rent"]
    
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
            categoryArray.append(UIButton())
            categoryArray[i].setTitle(temporaryCategoryArray[i], for: .normal)
            categoryArray[i].setTitleColor(UIColor.appBlue, for: .normal)
            categoryArray[i].titleLabel?.font = UIFont.proximaMedium
        }
        
        for i in 0..<10 {
            moviesArray.append(UIImageView())
            moviesArray[i].image = UIImage(with: .temporaryImage)
            moviesArray[i].layer.cornerRadius = 10
            moviesArray[i].layer.masksToBounds = true
            moviesArray[i].backgroundColor = .blue
        }
    }
    
    
}

