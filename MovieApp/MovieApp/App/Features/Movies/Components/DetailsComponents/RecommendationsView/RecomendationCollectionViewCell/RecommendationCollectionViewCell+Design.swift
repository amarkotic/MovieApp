import UIKit
import SnapKit

extension RecommendationCollectionViewCell: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        title = UILabel(with: .bold(size: 16))
        contentView.addSubview(title)
    }
    
    func styleViews() {
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        imageView.image = UIImage(with: .temporaryImage)
        imageView.contentMode = .scaleAspectFill
        
        title.text = "Iron man 1"
        title.textColor = .appBlue
    }
    
    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(imageHeight)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(9)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    
    
}
