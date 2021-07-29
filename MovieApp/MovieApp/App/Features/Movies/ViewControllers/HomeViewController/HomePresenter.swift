import UIKit

class HomePresenter {
    
    var mockData = [CategoryViewModel(
                        title: "What's popular",
                        categories: ["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"],
                        movies: [MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                            title: "spacejam",
                                            description: "spacejam_desc"),
                                 MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                            title: "spacejam",
                                            description: "spacejam_desc"),
                                 MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                            title: "spacejam",
                                            description: "spacejam_desc")]),
                    CategoryViewModel(
                        title: "Top rated",
                        categories: ["Action", "Comedy", "Drama", "Family", "Music", "Mystery", "Thriller", "Western"],
                        movies:  [MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                             title: "spacejam",
                                             description: "spacejam_desc")]),
                    CategoryViewModel(
                        title: "Trending",
                        categories: ["Today", "This week"],
                        movies:  [MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                             title: "spacejam",
                                             description: "spacejam_desc"),
                                  MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/8s4h9friP6Ci3adRGahHARVd76E.jpg",
                                             title: "spacejam",
                                             description: "spacejam_desc")])]
    
    weak private var delegate: HomeViewController?
    
    func setDelegate(delegate: HomeViewController?) {
        self.delegate = delegate
    }
    
    func fetchMovies(title: String, category: String) {
        /*
         Didn't cover all possibilities because it wont be done this way, this is only for demonstration purpose
         that taps are differantiated.
         Each tap on category will execute fetch which will refresh currently shown [CategoryViewModel].
         */
        if title == Category.popular.rawValue {
            switch category{
            case Subcategory.comedy.rawValue:
                mockData[0].movies = ([MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/ok7RdHhVngnwkvKj09tvtOvypG.jpg",
                                                     title: "spacejam",
                                                     description: "spacejam_desc")])
            case Subcategory.drama.rawValue:
                mockData[0].movies = ([MovieModel(imageUrl: "https://image.tmdb.org/t/p/original//70AV2Xx5FQYj20labp0EGdbjI6E.jpg",
                                                     title: "spacejam",
                                                     description: "spacejam_desc")])
            default:
                mockData[0].movies = ([MovieModel(imageUrl: "https://image.tmdb.org/t/p/original/rMoVOCw6DF3zC6hS76ZhQMWiXNX.jpg",
                                                     title: "spacejam",
                                                     description: "spacejam_desc")])
            }
        }
    }
    
}
