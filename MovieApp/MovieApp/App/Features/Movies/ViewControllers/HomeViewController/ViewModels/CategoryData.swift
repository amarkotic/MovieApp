import UIKit

struct CategoryViewModel {
    
    let title: CategoryEnum
    let categories: [SubcategoryEnum]
    //Temporary changed to var just for demonstration purposes with mocked data
    var movies: [MovieViewModel]
    
}
