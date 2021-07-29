import UIKit

class HomePresenter {
    
    var mockData = [CategoryViewModel(
                        title: .popular,
                        categories: [.action, .comedy, .drama, .family, .music, .mystery, .thriller, .western],
                        movies: [MovieViewModel(id: 1,
                                                imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                isFavorite: true),
                                 MovieViewModel(id: 2,
                                                imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                isFavorite: true),
                                 MovieViewModel(id: 3,
                                                imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                isFavorite: true)]),
                    CategoryViewModel(
                        title: .topRated,
                        categories: [.action, .comedy, .drama, .family, .music, .mystery, .thriller, .western],
                        movies:  [MovieViewModel(id: 4,
                                                 imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                 isFavorite: false)]),
                    CategoryViewModel(
                        title: .trending,
                        categories: [.today, .thisWeek],
                        movies:  [MovieViewModel(id: 5,
                                                 imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                 isFavorite: false),
                                  MovieViewModel(id: 6,
                                                 imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                                 isFavorite: false)]
                    )
    ]
     
    weak private var delegate: HomeViewController?
    
    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
    }
    
    func fetchMovies(category: CategoryEnum, subCategory: SubcategoryEnum) {
        /*
         Didn't cover all possibilities because it wont be done this way, this is only for demonstration purpose
         that taps are differantiated.
         Each tap on category will execute fetch which will refresh currently shown [CategoryViewModel].
         */
        if category == .popular {
            switch subCategory{
            case .comedy:
                mockData[0].movies = ([MovieViewModel(id: 1,
                                                      imageUrl: "https://image.tmdb.org/t/p/original/ok7RdHhVngnwkvKj09tvtOvypG.jpg",
                                                      isFavorite: false)])
            case .drama:
                mockData[0].movies = ([MovieViewModel(id: 2,
                                                      imageUrl: "https://image.tmdb.org/t/p/original//70AV2Xx5FQYj20labp0EGdbjI6E.jpg",
                                                      isFavorite: false)])
            default:
                mockData[0].movies = ([MovieViewModel(id: 3,
                                                      imageUrl: "https://image.tmdb.org/t/p/original/rMoVOCw6DF3zC6hS76ZhQMWiXNX.jpg",
                                                      isFavorite: false)])
            }
        }
    }
    
}
