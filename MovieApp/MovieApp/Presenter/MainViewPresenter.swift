import UIKit

class MainViewPresenter {
    
    private let dataService : MovieDataService
    weak private var mainViewDelegate : MainViewController?
    
    init(dataService : MovieDataService){
        self.dataService = dataService
    }
    
    //Fetches movies array from data service
    func fetchMovies() -> [Movie]{
        return dataService.fetchMovies()
    }
}
