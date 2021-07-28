import UIKit
import SnapKit

extension SubcategoryItemView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        titleLabel = UILabel(with: .proximaMedium)
        addSubview(titleLabel)
        
        underline = UIView()
        addSubview(underline)
    }
    
    func styleViews() {
        isUserInteractionEnabled = true

        titleLabel.textColor = .appGray
        titleLabel.textAlignment = .center
        
        underline.backgroundColor = .appBlue
        underline.isHidden = true
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }
        
        underline.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(defaultOffset)
            $0.height.equalTo(underlineHeight)
        }
    }
    
}
