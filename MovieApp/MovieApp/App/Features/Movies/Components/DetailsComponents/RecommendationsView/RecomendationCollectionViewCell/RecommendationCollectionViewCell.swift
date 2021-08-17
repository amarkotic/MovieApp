import UIKit
import Kingfisher

class RecommendationCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RecommendationCollectionViewCell.self)
    
    let defaultOffset = 9
    let imageHeight = 85
    let cornerRadius: CGFloat = 10

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
        imageView.kf.setImage(with: URL(string: model.imageName))
        title.text = model.title
    }

}
