import UIKit

class SubcategoryScrollView: UIScrollView {
    
    let stackViewSpacing = CGFloat(23)
    var indexSelected = 0
    
    var stackView: UIStackView!
    
    private weak var scrollViewDelegate: CategoryTableViewCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(delegate: CategoryTableViewCell) {
        scrollViewDelegate = delegate
    }
    
    func setData(categories: [SubcategoryEnum]) {
        updateLayout()
        createCategoryViews(with: categories)
    }
    
    private func updateLayout() {
        stackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func createCategoryViews(with categories: [SubcategoryEnum]) {
        categories.enumerated().forEach { index, category in
            let item = SubcategoryItemView(category: category)
            stackView.addArrangedSubview(item)
            item.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleTapped)))
            let isSelected = index == indexSelected
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
        
        items.enumerated().forEach { index, arrayItem in
            if (item.category == arrayItem.category) {
                arrayItem.styleSelect()
                indexSelected = index
            } else {
                arrayItem.styleDeselect()
            }
        }
        delegate.subcategoryPressed(subCategory: item.category)
    }
    
}
