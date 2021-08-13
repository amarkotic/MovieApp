import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 20
    let recommendationsCollectionViewHeight = 114
    let castCollectionViewHeight = 259
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    var socialView: SocialView!
    var recommendationView: RecommendationsView!
    
    var presenter: DetailsPresenter!
    
    convenience init(presenter: DetailsPresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        setupNavigationBackButton()
        presenter.setDelegate(delegate: self)
        presenter.fetchData()
    }
    
    func setData(model: MovieDetailsViewModel) {
        mainInfoView.setData(with: model.info)
        overviewView.setData(with: model.overview)
        castView.setData(with: model.actors)
        socialView.setData(with: model.review)
        recommendationView.setData(with: model.recommendations)
    }
    
    private func setupNavigationBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(with: .backButton),
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func backButtonPressed(){
        presenter.popToHomeScreen()
    }

}
