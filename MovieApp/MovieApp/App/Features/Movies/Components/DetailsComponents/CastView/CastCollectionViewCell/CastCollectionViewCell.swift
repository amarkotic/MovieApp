import UIKit
import Kingfisher

class CastCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CastCollectionViewCell.self)
    
    let defaultOffset = 5
    let actorImageHeight = 130
    let cornerRadius = CGFloat(10)
    
    var actorImageView: UIImageView!
    var nameLabel: UILabel!
    var roleLabel: UILabel!
    
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
    
    func setData(model: ActorViewModel) {
        nameLabel.text = model.nameLabel
        roleLabel.text = model.roleLabel
        actorImageView.kf.setImage(with: URL(string: model.posterPath))
    }
    
}
