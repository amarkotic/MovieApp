import UIKit

class DetailsPresenter {

    var appRouter: AppRouter!
    var movieUseCase: MoviesUseCaseProtocol!
    var netclient: MoviesNetworkClientProtocol!
    weak private var delegate: DetailsViewController?
    
    init(movieUseCase: MoviesUseCaseProtocol, netClient: MoviesNetworkClientProtocol, router: AppRouter) {
        self.movieUseCase = movieUseCase
        self.netclient = netClient
        self.appRouter = router
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData(with id: Int) {
        
        netclient.getMovie(with: id) { (result: Result<MovieDetailsNetworkModel, NetworkError>) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let value):
               print(value)
            }
        }
        
//        delegate?.setData(model: MovieDetailsViewModel())
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
