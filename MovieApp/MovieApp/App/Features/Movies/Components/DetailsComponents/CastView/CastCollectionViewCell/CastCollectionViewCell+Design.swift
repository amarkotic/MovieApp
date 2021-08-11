import UIKit
import SnapKit

extension CastCollectionViewCell: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        actorImageView = UIImageView()
        contentView.addSubview(actorImageView)
        
        nameLabel = UILabel(with: .bold(size: 14))
        contentView.addSubview(nameLabel)
        
        roleLabel = UILabel(with: .medium(size: 12))
        contentView.addSubview(roleLabel)
    }
    
    func styleViews() {
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        actorImageView.layer.masksToBounds = true
        actorImageView.contentMode = .scaleAspectFill
        
        nameLabel.textColor = .appBlack
        nameLabel.numberOfLines = 0

        roleLabel.textColor = .appGray
    }
    
    func defineLayoutForViews() {
        actorImageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(actorImageHeight)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(2 * defaultOffset)
            $0.trailing.equalToSuperview().inset(6 * defaultOffset)
            $0.top.equalTo(actorImageView.snp.bottom).offset(3 * defaultOffset)
        }
        
        roleLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(nameLabel.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.equalToSuperview().offset(2 * defaultOffset)
            $0.bottom.equalToSuperview().inset(2 * defaultOffset)
        }
        
    }
    
}
