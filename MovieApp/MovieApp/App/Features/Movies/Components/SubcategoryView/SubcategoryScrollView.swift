import UIKit

class SubcategoryScrollView: UIScrollView {
    
    let stackViewSpacing = CGFloat(23)
    
    var stackView: UIStackView!
    
    private weak var scrollViewDelegate: CategoryTableViewCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScrollViewDelegate(delegate: CategoryTableViewCell) {
        scrollViewDelegate = delegate
    }
    
    func setData(categories: [String]) {
        updateLayout()
        createCategoryViews(with: categories)
    }
    
    private func updateLayout() {
        stackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func createCategoryViews(with categories: [String]) {
        categories.enumerated().forEach { index, category in
            let item = SubcategoryItemView(category: category)
            stackView.addArrangedSubview(item)
            
            item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleTapped)))
            
            let isSelected = index == 0
            isSelected ? item.styleSelect() : item.styleDeselect()
        }
    }
    
    @objc private func titleTapped(_ sender: UITapGestureRecognizer) {
        guard
            let item = sender.view as? SubcategoryItemView,
            let items = stackView.subviews as? [SubcategoryItemView],
            let delegate = scrollViewDelegate
        else {
            return
        }

        items.forEach {
            let isTapped = item.category == $0.category
            isTapped ? $0.styleSelect() : $0.styleDeselect()
        }
        delegate.subcategoryPressed(category: item.category)
    }
    
}
