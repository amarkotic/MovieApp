import UIKit
import SnapKit

extension OverviewView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        title = UILabel(with: .bold(size: 20))
        addSubview(title)
        
        overview = UILabel(with: .proximaMedium)
        addSubview(overview)
    }
    
    func styleViews() {
        title.text = LocalizableStrings.overview.rawValue
        title.textColor = .appBlue
        
        overview.textColor = .black
        overview.numberOfLines = 0
    }
    
    func defineLayoutForViews() {
        title.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        
        overview.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
