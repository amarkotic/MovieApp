import UIKit

class MovieImageView: UIImageView {
    
    let defaultOffset = 9
    let ellipseSize = CGSize(width: 32, height: 32)
    let heartSize = CGSize(width: 18, height: 16)
    
    var ellipseImageView: UIImageView!
    var heartImageView: UIImageView!
    var favorite = false

    
    override init(image: UIImage?) {
        super.init(image: image)
        
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
        if !favorite {
            heartImageView.image = UIImage(with: .heartFilled)
        } else {
            heartImageView.image = UIImage(with: .heartEmpty)
        }
        favorite = !favorite
    }
    
}
