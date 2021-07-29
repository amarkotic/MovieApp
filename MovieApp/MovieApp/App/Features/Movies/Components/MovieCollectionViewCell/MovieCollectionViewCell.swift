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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with movie: MovieViewModel) {
        let image = movie.isFavorite ? UIImage(with: .heartFilled) : UIImage(with: .heartEmpty)
        let url = URL(string: movie.imageUrl)
        movieImageView.kf.setImage(with: url)
        heartImageView.image = image
    }
    
    private func enableInteraction() {
        ellipseImageView.isUserInteractionEnabled = true
    }
    
}
