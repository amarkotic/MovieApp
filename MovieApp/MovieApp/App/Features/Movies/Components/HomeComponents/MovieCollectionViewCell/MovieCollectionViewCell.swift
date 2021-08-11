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
    
    var viewModel: MovieViewModel! {
        didSet {
            let image = viewModel.isFavorite ? UIImage(with: .heartFilled) : UIImage(with: .heartEmpty)
            let url = URL(string: viewModel.imageUrl)
            movieImageView.kf.setImage(with: url)
            heartImageView.image = image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with movieViewModel: MovieViewModel) {
        viewModel = movieViewModel
    }
    
    private func enableInteraction() {
        ellipseImageView.isUserInteractionEnabled = true
    }
    
}
