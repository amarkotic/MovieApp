import UIKit

class SubcategoryItemView: UIView {
    
    let underlineHeight = 3
    let defaultInset = 10
    let defaultOffset = 4
    
    let category: SubcategoryEnum
    
    var titleLabel: UILabel!
    var underline: UIView!
    
    init(category: SubcategoryEnum) {
        self.category = category
        super.init(frame: .zero)
        
        buildViews()
        setData(title: category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setData(title: SubcategoryEnum) {
        titleLabel.text = title.rawValue
    }
    
    func styleSelect() {
        underline.isHidden = false
        titleLabel.textColor = .black
        titleLabel.font = .proximaBold
    }
    
    func styleDeselect() {
        underline.isHidden = true
        titleLabel.textColor = .appGray
        titleLabel.font = .proximaMedium
    }

}
