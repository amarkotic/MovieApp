import UIKit

class SubcategoryView: UIView {
    
    let underlineHeight = 3
    let defaultInset = 10
    
    var titleLabel: UILabel!
    var underline: UIView!
    var isSelected = false
    var identifier: Int!
    
    weak var delegate: CategoryTableViewCell?
    
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
            self.isSelected = true
            delegate.update(with: identifier)
        } else {
           deselect()
            self.isSelected = true
        }
        isSelected = !isSelected
    }
    
    func select() {
        underline.isHidden = false
        titleLabel.textColor = .black
        titleLabel.font = .proximaBold
        titleLabel.snp.updateConstraints {
            $0.leading.trailing.equalToSuperview().inset(5)
        }
    }
    
    func deselect() {
        underline.isHidden = true
        titleLabel.textColor = .appGray
        titleLabel.font = .proximaMedium
        titleLabel.snp.updateConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }
    
}
