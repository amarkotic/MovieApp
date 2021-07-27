import UIKit

class HomePresenter {
    
    let data = CategoryData()
    
    weak private var delegate: HomeViewController?
    
    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
    }
    
    func fetchCategories() {
        delegate?.get(categories: data.categories, subcategories: data.subCategories)
    }
    
}
