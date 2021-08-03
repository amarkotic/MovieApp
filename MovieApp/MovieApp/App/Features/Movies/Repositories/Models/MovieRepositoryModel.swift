import UIKit

struct MovieRepositoryModel {
    
    let id: Int
    let imageUrl: String
    let title: String
    let description: String
    let genreIds: [SubcategoryRepositoryModel]
    
}
