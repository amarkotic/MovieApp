import UIKit

class SubcategoryView: UIView {
    
    let underlineHeight = 3
    let defaultInset = 10
    
    var titleLabel: UILabel!
    var underline: UIView!
    var isSelected = false
    var globalIdentifier: Int!
    var identifier: Int!
    
    weak var delegate: CategoryCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func enableInteraction() {
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleTapped)))
    }
    
    @objc private func titleTapped(_ recognizer: UITapGestureRecognizer) {
        guard let delegate = delegate else { return }
        
        if !isSelected {
            select()
            delegate.update(with: identifier)
        }
        isSelected = !isSelected
    }
    
    func select() {
        underline.isHidden = false
        titleLabel.textColor = .black
        titleLabel.font = .proximaBold
        isSelected = true
    }
    
    func deselect() {
        underline.isHidden = true
        titleLabel.textColor = .appGray
        titleLabel.font = .proximaMedium
        isSelected = false
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }
    
}
