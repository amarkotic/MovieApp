import UIKit

class HomePresenter {
    
    let mockData = [CategoryViewModel(
                        title: "What's popular",
                        categories: ["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"]),
                    CategoryViewModel(
                        title: "Top rated",
                        categories: ["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"]),
                    CategoryViewModel(
                        title: "Trending",
                        categories: ["Today", "This week"])]
    let data = CategoryData()
    
    weak private var delegate: HomeViewController?
    
    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
    }
    
//    func fetchCategories() {
//        delegate?.get(categories: data.categories, subcategories: data.subCategories)
//    }
    
}
