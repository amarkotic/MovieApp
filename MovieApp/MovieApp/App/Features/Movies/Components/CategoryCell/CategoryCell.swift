import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    
    var titleLabel: UILabel!
    
    var categoryScrollView: UIScrollView!
    var categoryStackView: UIStackView!
    var categoryArray = [SubcategoryView]()
    
    var moviesScrollView: UIScrollView!
    var moviesStackView: UIStackView!
    var moviesArray = [MovieImageView]()
    
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
            let titleView = SubcategoryView(frame: .zero)
            titleView.isUserInteractionEnabled = true
            titleView.setData(title: temporaryCategoryArray[i])
            categoryArray.append(titleView)
        }
        
        for i in 0..<10 {
            let imageView = MovieImageView(image: UIImage(with: .temporaryImage))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped)))
            moviesArray.append(imageView)
            moviesArray[i].layer.cornerRadius = 10
            moviesArray[i].layer.masksToBounds = true
            moviesArray[i].backgroundColor = .blue
        }
    }
    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        print("image tapped")
    }
}





