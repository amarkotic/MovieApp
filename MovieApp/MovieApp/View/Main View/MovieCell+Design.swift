import UIKit
import SnapKit

extension MovieCell : DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        mainView = UIView()
        addSubview(mainView)
        
        movieImageView = UIImageView()
        mainView.addSubview(movieImageView)
        
        titleLabel = UILabel()
        mainView.addSubview(titleLabel)
        
        descriptionLabel = UILabel()
        mainView.addSubview(descriptionLabel)
    }
    
    func styleViews() {
        let proximaFont = FontStruct()
        self.backgroundColor = .white
        
        //Main view which contains all cell elements
        mainView.backgroundColor = .white
        mainView.layer.cornerRadius = 10
        mainView.clipsToBounds = true
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowOffset = .zero
        mainView.layer.shadowRadius = 3
        mainView.layer.masksToBounds = false
        
        //Image view
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 10
        movieImageView.layer.maskedCorners =  [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        //Title label
        titleLabel.font = UIFont(name: proximaFont.proximaBold, size: 16)
        titleLabel.textColor = Color.init().customBlack
        
        //Description label
        descriptionLabel.font = UIFont(name: proximaFont.proximaMedium, size: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = Color.init().customGray
    }
    
    func defineLayoutForViews() {
        mainView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview().inset(5)
        }
        
        movieImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(13)
            make.height.equalTo(20)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieImageView.snp.trailing).offset(15)
            make.trailing.equalTo(mainView.snp.trailing).offset(-30)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
    }
}
