import UIKit
import Kingfisher

class RecommendationCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RecommendationCollectionViewCell.self)
    
    let imageHeight = 85
    let cornerRadius = CGFloat(10)
    
    var imageView: UIImageView!
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        
        contentView.backgroundColor = .white
    }
    
}
