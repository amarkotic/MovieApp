import UIKit

class MainViewPresenter {
    
    private let dataService: MovieDataServiceProtocol
    
    init(dataService: MovieDataServiceProtocol){
        self.dataService = dataService
    }
    
    var movies: [Movie] {
        dataService.fetchMovies()
    }
    
}
