import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 20
    let defaultInset = 18
    let recommendationsCollectionViewHeight = 114
    let castCollectionViewHeight = 106
    let actorsCollectionViewHeight = 259
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    var actorsView: ActorsView!
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
        mainInfoView.setDelegate(delegate: self)
        presenter.fetchData()
    }
    
    func setMainInfoData(model: MovieDetailsViewModel) {
        mainInfoView.setData(with: model.info)
        overviewView.setData(with: model.overview)
    }
    
    func setActorsData(model: [ActorViewModel]) {
        actorsView.setData(with: model)
    }
    
    func setCastData(model: [CastViewModel]) {
        castView.setData(with: model)
    }
    
    func setReviewData(model: SocialViewModel) {
        socialView.setData(with: model)
    }
    
    func setRecommendationsData(model: [RecommendationsViewModel]) {
        recommendationView.setData(with: model)
    }
    
    func favoritePressed() {
        presenter.updateFavoriteMovie()
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
