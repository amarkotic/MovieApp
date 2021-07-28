import UIKit
import SnapKit

extension SubcategoryScrollView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        stackView = UIStackView()
        subcategoryArray.forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    func styleViews() {
        stackView.distribution = .equalSpacing
        stackView.spacing = stackViewSpacing
    }
    
    func defineLayoutForViews() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
