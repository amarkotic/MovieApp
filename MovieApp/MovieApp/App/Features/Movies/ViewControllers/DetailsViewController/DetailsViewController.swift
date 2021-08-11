import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 18
    
    var presenter: DetailsPresenter!
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    
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
    }
    
}
