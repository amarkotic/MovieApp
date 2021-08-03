import UIKit
import SnapKit

extension OverviewView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        title = UILabel(with: .proximaBold)
        addSubview(title)
        
        overview = UILabel(with: .proximaMedium)
        addSubview(overview)
    }
    
    func styleViews() {
        title.text = "Overview"
        title.textColor = .black
        
        overview.text = "After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil."
        overview.textColor = .black
        overview.numberOfLines = 0
    }
    
    func defineLayoutForViews() {
        title.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        
        overview.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
