import UIKit
import Alamofire

class MainViewPresenter {
    
    private let dataService: MovieDataService
    private let networkService: NetworkService
    weak private var mainViewDelegate: MainViewController?
    
    init(dataService: MovieDataService, networkService: NetworkService){
        self.dataService = dataService
        self.networkService = networkService
    }
    
    func setMainViewDelegate(mainViewDelegate: MainViewController?){
        self.mainViewDelegate = mainViewDelegate
    }
    
    //Fetches movies array from data service
    func fetchMovies() -> [Movie] {
        return dataService.fetchMovies()
    }
    
    func fetchMoviesWithAlamofire() {
        networkService.fetchMovies { (movies, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let movies = movies {
                print(movies)
            }
        }
       
    }
    
}
