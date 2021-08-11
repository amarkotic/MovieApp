import UIKit

class DetailsViewController: UIViewController {
    
    var presenter: DetailsPresenter!
    var mainInfoView: MainInfoView!
    
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
    }
    
}
