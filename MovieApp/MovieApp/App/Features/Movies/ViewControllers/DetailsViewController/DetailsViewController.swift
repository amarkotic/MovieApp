import UIKit
import Combine

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
    private var disposables = Set<AnyCancellable>()

    convenience init(presenter: DetailsPresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        styleNavigationBar()
        presenter.setDelegate(delegate: self)
        mainInfoView.setDelegate(delegate: self)
        bindViews()
    }
    
    func favoritePressed() {
        presenter.updateFavoriteMovie()
    }
    
    func hideReview() {
        socialView.postTitle.text = LocalizableStrings.noReview.rawValue
        socialView.postInfo.text = LocalizableStrings.tryAgain.rawValue
        socialView.logoImage.image = UIImage(with: .noReview)
    }
    
    private func bindViews() {
        presenter
            .detailsData
            .sink {_ in }
                receiveValue: { [weak self] in
                    self?.setData(with: $0)
                }
            .store(in: &disposables)
    }
    
    private func setData(with model: MovieDetailsViewModel) {
        self.mainInfoView.setData(with: model.info.mainInfoModel)
        self.overviewView.setData(with: model.info.overviewModel)
        self.actorsView.setData(with: Array(model.credits.actors.prefix(10)))
        self.castView.setData(with: Array(model.credits.cast.prefix(6)))
    }
    
    private func styleNavigationBar() {
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView()
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
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
