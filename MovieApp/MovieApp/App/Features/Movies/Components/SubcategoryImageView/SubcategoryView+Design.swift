import UIKit
import SnapKit

extension SubcategoryView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        titleLabel = UILabel()
        addSubview(titleLabel)
        
        underline = UIView()
        addSubview(underline)
    }
    
    func styleViews() {
        titleLabel.textColor = .appGray
        titleLabel.font = UIFont.proximaMedium
        titleLabel.textAlignment = .center
        
        underline.backgroundColor = .appBlue
        underline.isHidden = true
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        underline.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(underlineHeight)
        }
    }
    
}
