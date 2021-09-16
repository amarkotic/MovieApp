import UIKit
import Combine
import Reachability

class DetailsViewController: UIViewController {

    let defaultOffset = 20
    let defaultInset = 18
    let recommendationsCollectionViewHeight = 114
    let castCollectionViewHeight = 106
    let actorsCollectionViewHeight = 259
    let noInternetLabelHeight = 50
    let reachability = try? Reachability()

    var scrollView: UIScrollView!
    var contentView: UIView!

    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    var actorsView: ActorsView!
    var socialView: SocialView!
    var recommendationView: RecommendationsView!
    var noInternetLabel: UILabel!

    private var presenter: DetailsPresenter!
    private var disposables = Set<AnyCancellable>()

    convenience init(presenter: DetailsPresenter) {
        self.init()

        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        styleNavigationBar()
        mainInfoView.setDelegate(delegate: self)
        bindViews()
        checkReachability()
    }

    func favoritePressed(with url: String) {
        presenter.updateFavoriteMovie(with: url)
        bindViews()
    }

    private func hideReview() {
        socialView.postTitle.text = LocalizableStrings.noReview.rawValue
        socialView.postInfo.text = LocalizableStrings.tryAgain.rawValue
        socialView.logoImage.image = UIImage(with: .noReview)
    }

    private func checkReachability() {
        guard let reachability = reachability else { return }

        reachability.whenReachable = { [weak self] _ in
            self?.connectionReachable()
        }
        reachability.whenUnreachable = { [weak self] _ in
            self?.connectionUnreachable()
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    private func connectionReachable() {
        noInternetLabel.isHidden = true
    }

    private func connectionUnreachable() {
        mainInfoView.isHidden = true
        overviewView.isHidden = true
        castView.isHidden = true
        actorsView.isHidden = true
        socialView.isHidden = true
        recommendationView.isHidden = true
        noInternetLabel.isHidden = false
    }

    private func bindViews() {
        presenter
            .detailsData
            .sink { _ in }
                receiveValue: { [weak self] in
                    self?.setData(with: $0)
                }
            .store(in: &disposables)
    }

    private func setData(with model: MovieDetailsViewModel) {
        mainInfoView.setData(with: model.info.mainInfoModel)
        overviewView.setData(with: model.info.overviewModel)
        actorsView.setData(with: Array(model.credits.actors.prefix(10)))
        castView.setData(with: Array(model.credits.cast.prefix(6)))
        recommendationView.setData(with: model.recommendations)
        guard
            let review = model.reviews.first
        else {
            hideReview()
            return
        }
        socialView.setData(with: review)
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

    @objc func backButtonPressed() {
        presenter.popToHomeScreen()
    }

}
