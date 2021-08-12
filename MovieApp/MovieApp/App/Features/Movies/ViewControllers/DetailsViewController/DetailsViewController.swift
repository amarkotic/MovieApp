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
    var identifier: Int!
    
    convenience init(presenter: DetailsPresenter, identifier: Int) {
        self.init()
        
        self.presenter = presenter
        self.identifier = identifier
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        presenter.setDelegate(delegate: self)
        presenter.fetchData(with: identifier)
        
        setupNavigationBackButton()
    }
    
    func setMainInfoData(model: MovieDetailsViewModel) {
        mainInfoView.setData(with: model.info)
        overviewView.setData(with: model.overview)
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
