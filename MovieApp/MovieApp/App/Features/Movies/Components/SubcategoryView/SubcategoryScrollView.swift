import UIKit

class SubcategoryScrollView: UIScrollView {
    
    let stackViewSpacing = CGFloat(23)
    
    var stackView: UIStackView!
    var subcategories = [String]()
    var subcategoryArray = [SubcategoryItem]()
    var category: String!
    var firstLoad = true
    
    private weak var scrollViewDelegate: CategoryTableViewCell?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createButtons() {
        for i in 0..<subcategories.count {
            let subcategoryItem = SubcategoryItem(frame: .zero)
            subcategoryItem.setSubcategoryItemDelegate(delegate: self)
            subcategoryItem.isUserInteractionEnabled = true
            subcategoryItem.identifier = i
            if (subcategoryItem.identifier == 0) {
                subcategoryItem.select()
            }
            subcategoryItem.setData(title: subcategories[i])
            subcategoryArray.append(subcategoryItem)
        }
        buildViews()
    }
    
    func populateCell(category: String, subcategories: [String]) {
        self.subcategories = subcategories
        self.category = category
        if(firstLoad){
            createButtons()
            firstLoad = false
        }
    }
    
    func update(with identifier: Int) {
        guard let delegate = scrollViewDelegate else { return }
        
        delegate.subcategoryPressed(identifier: identifier, category: category)
        for item in subcategoryArray {
            if item.identifier != identifier {
                item.deselect()
            }
        }
    }
    
    func setScrollViewDelegate(delegate: CategoryTableViewCell) {
        scrollViewDelegate = delegate
    }
    
}
