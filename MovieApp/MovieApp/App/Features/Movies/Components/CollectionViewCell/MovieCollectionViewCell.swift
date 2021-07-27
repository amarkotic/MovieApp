import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MovieCollectionViewCell.self)
    
    let defaultOffset = 9
    let ellipseSize = CGSize(width: 32, height: 32)
    let heartSize = CGSize(width: 18, height: 16)
    let cornerRadius = CGFloat(10)
    
    var imageView: UIImageView!
    var ellipseImageView: UIImageView!
    var heartImageView: UIImageView!
    var isFavorite = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func enableInteraction() {
        ellipseImageView.isUserInteractionEnabled = true
        ellipseImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(heartTapped)))
    }
    
    @objc private func heartTapped(_ recognizer: UITapGestureRecognizer) {
        if !isFavorite {
            heartImageView.image = UIImage(with: .heartFilled)
        } else {
            heartImageView.image = UIImage(with: .heartEmpty)
        }
        isFavorite = !isFavorite
    }
    
    func setData(with image: UIImage){
        imageView.image = image
    }
    
}
