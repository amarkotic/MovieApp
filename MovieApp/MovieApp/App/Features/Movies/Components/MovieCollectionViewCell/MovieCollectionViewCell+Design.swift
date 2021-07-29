import UIKit
import SnapKit

extension MovieCollectionViewCell: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        ellipseImageView = UIImageView()
        contentView.addSubview(ellipseImageView)
        
        heartImageView = UIImageView()
        ellipseImageView.addSubview(heartImageView)
    }
    
    func styleViews() {
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.masksToBounds = true
        
        ellipseImageView.image = UIImage(with: .ellipseImage)
        
        heartImageView.image = UIImage(with: .heartEmpty)
    }
    
    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        ellipseImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(defaultOffset)
            $0.size.equalTo(ellipseSize)
        }
        
        heartImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(heartSize)
        }
    }

}
