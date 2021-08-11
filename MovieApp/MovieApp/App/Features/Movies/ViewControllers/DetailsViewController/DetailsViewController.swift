import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 18
    let secondaryOffset = 20
    
    var presenter: DetailsPresenter!
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    
    convenience init(presenter: DetailsPresenter) {
        self.init()
        
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        presenter.setDelegate(delegate: self)
        presenter.fetchData()
    }
    
    func setData(with model: MovieDetailsViewModel) {
        mainInfoView.setData(with: model)
        overviewView.setData(model: model)
        castView.setData(model: model)
    }
    
}
