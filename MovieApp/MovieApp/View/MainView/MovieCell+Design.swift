import UIKit
import SnapKit

extension MovieCell: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        movieImageView = UIImageView()
        contentView.addSubview(movieImageView)
        
        titleLabel = UILabel(with: .proximaBold)
        contentView.addSubview(titleLabel)
        
        descriptionLabel = UILabel(with: .proximaMedium)
        contentView.addSubview(descriptionLabel)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 10
        movieImageView.layer.maskedCorners =  [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        titleLabel.textColor = .appBlue
        
        descriptionLabel.textColor = .appGray
        descriptionLabel.numberOfLines = 0
    }
    
    func defineLayoutForViews() {
        movieImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.width.equalTo(movieImageViewWidth)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(defaultInset * 3)
            $0.trailing.top.equalToSuperview().inset(defaultInset * 3)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(movieImageView.snp.trailing).offset(defaultInset * 3)
            $0.trailing.equalToSuperview().inset(defaultInset * 3)
            $0.top.equalTo(titleLabel.snp.bottom).offset(defaultInset)
            $0.bottom.lessThanOrEqualToSuperview().inset(defaultInset * 3)
        }
    }
    
}
