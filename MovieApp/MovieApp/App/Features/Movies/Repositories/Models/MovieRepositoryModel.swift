import UIKit

struct MovieRepositoryModel: Equatable {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let subcategories: [SubcategoryRepositoryModel]
    
}
