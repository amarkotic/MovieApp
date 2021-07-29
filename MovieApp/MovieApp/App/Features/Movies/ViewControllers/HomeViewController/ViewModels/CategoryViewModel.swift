import UIKit

struct CategoryData {
    
    let subCategories = [["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"],
                         ["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"],
                         ["Today", "This week"]]
    
    let categories = ["What's popular", "Top rated", "Trending"]
    
}

struct CategoryViewModel {
    
    let title: String
    let categories: [String]
}
