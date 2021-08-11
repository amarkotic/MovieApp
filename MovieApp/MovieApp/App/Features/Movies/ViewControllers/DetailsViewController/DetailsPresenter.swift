import UIKit

class DetailsPresenter {

    weak private var delegate: DetailsViewController?
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData() {
        let data = MovieDetailsViewModel()
        
        let infoData: MainInfoViewModel = data.info
        let overviewData: OverviewViewModel = data.overview
        let actorsData: ActorsViewModel = data.actors
        delegate?.setData(infoData: infoData, overviewData: overviewData, actorsData: actorsData)
    }
    
}
