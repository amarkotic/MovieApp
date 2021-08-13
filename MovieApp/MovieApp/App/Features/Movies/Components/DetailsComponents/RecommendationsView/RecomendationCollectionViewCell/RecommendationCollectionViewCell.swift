import UIKit
import Kingfisher

class RecommendationCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RecommendationCollectionViewCell.self)
    
    let defaultOffset = 9
    let imageHeight = 85
<<<<<<< HEAD
    let cornerRadius = CGFloat(10)
=======
    let cornerRadius: CGFloat = 10
>>>>>>> develop
    
    var imageView: UIImageView!
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with model: RecommendationsViewModel) {
        imageView.image = UIImage(named: model.imageName)
        title.text = model.title
    }
<<<<<<< HEAD
=======
    
>>>>>>> develop
}
