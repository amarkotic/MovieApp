import UIKit
import SnapKit

extension DetailsViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        moviePoster = UIImageView()
        view.addSubview(moviePoster)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
        moviePoster.image = UIImage(with: .temporaryImage)
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.layer.masksToBounds = true
    }
    
    func defineLayoutForViews() {
        moviePoster.snp.makeConstraints{
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(303)
        }
        
    }
    
}
