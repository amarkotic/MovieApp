import UIKit

struct CategoryViewModel: Hashable {

    let title: MovieCategoryViewModel
    let categories: [SubcategoryViewModel]
    var movies: [MovieViewModel]

}
