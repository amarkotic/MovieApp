import UIKit

class DetailsPresenter {

    var appRouter: AppRouter!
    weak private var delegate: DetailsViewController?
    
    init(router: AppRouter) {
        self.appRouter = router
    }
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData() {
        delegate?.setData(model: MovieDetailsViewModel())
    }
    
    func popToHomeScreen() {
        appRouter.showHomeScreen()
    }
    
}
