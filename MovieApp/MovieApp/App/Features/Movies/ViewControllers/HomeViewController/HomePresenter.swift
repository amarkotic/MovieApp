import UIKit

class HomePresenter {
    
    let mockData = [CategoryViewModel(
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
    
}
