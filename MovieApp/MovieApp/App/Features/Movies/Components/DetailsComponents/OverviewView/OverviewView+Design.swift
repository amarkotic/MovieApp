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
        
        overview.text = "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        overview.textColor = .black
        overview.numberOfLines = 0
    }
    
    func defineLayoutForViews() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
        }
        
        overview.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.bottom.equalToSuperview()
        }
    }
    
}
