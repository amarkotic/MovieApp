import UIKit

class SubcategoryView: UIView {
    
    var titleLabel: UILabel!
    var underline: UIView!
    var selected = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        enableInteraction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(title: String) {
        titleLabel.text = title
    }
    
    private func enableInteraction() {
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleTapped)))
    }
    
    @objc private func titleTapped(_ recognizer: UITapGestureRecognizer) {
        if !selected {
            underline.isHidden = false
            titleLabel.textColor = .black
            titleLabel.font = .proximaBold
            titleLabel.snp.updateConstraints {
                $0.leading.trailing.equalToSuperview()
            }
        } else {
            underline.isHidden = true
            titleLabel.textColor = .appGray
            titleLabel.font = .proximaMedium
            titleLabel.snp.updateConstraints {
                $0.leading.trailing.equalToSuperview().inset(10)
            }
        }
        selected = !selected
    }
}
