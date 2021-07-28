import UIKit

class SubcategoryItem: UIView {
    
    let underlineHeight = 3
    let defaultInset = 10
    let defaultOffset = 4
    
    var titleLabel: UILabel!
    var underline: UIView!
    var isSelected = false
    var identifier: Int!

    private weak var delegate: SubcategoryScrollView?
    
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
    }
    
    func select() {
        isSelected = true
        underline.isHidden = false
        titleLabel.textColor = .black
        titleLabel.font = .proximaBold
    }
    
    func deselect() {
        isSelected = false
        underline.isHidden = true
        titleLabel.textColor = .appGray
        titleLabel.font = .proximaMedium
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }
    
    func setSubcategoryItemDelegate(delegate: SubcategoryScrollView) {
        self.delegate = delegate
    }
    
}
