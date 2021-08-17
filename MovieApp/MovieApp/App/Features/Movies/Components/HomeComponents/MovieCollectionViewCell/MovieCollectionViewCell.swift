import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MovieCollectionViewCell.self)
    
    let defaultOffset = 9
    let ellipseSize = CGSize(width: 32, height: 32)
    let heartSize = CGSize(width: 18, height: 16)
    let cornerRadius = CGFloat(10)
    
    var movieImageView: UIImageView!
    var ellipseImageView: UIImageView!
    var heartImageView: UIImageView!
    
    var heartIsTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with model: MovieViewModel) {
        let url = URL(string: model.imageUrl)
        movieImageView.kf.setImage(with: url)
        heartImageView.image = model.isFavorite ? UIImage(with: .favoriteLogoSelected) : UIImage(with: .favoriteLogo)
    }
    
    private func enableInteraction() {
        ellipseImageView.isUserInteractionEnabled = true
        ellipseImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(heartTapped)))
    }
    
    @objc private func heartTapped() {
        heartIsTapped?()
    }
    
}
