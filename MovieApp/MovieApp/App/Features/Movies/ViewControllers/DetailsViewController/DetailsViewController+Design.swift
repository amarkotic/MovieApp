import UIKit
import SnapKit

extension DetailsViewController: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        scrollView = UIScrollView()
        view.addSubview(scrollView)

        contentView = UIView()
        scrollView.addSubview(contentView)

        mainInfoView = MainInfoView()
        contentView.addSubview(mainInfoView)

        overviewView = OverviewView()
        contentView.addSubview(overviewView)

        castView = CastView()
        contentView.addSubview(castView)

        actorsView = ActorsView()
        contentView.addSubview(actorsView)

        socialView = SocialView()
        contentView.addSubview(socialView)

        recommendationView = RecommendationsView()
        contentView.addSubview(recommendationView)

        noInternetLabel = UILabel(with: .proximaMedium)
        view.addSubview(noInternetLabel)
    }

    func styleViews() {
        view.backgroundColor = .white

        noInternetLabel.text = LocalizableStrings.noInternet.rawValue
        noInternetLabel.backgroundColor = .gray
        noInternetLabel.textAlignment = .center
        noInternetLabel.isHidden = true
    }

    func defineLayoutForViews() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualTo(scrollView)
        }

        mainInfoView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
        }

        overviewView.snp.makeConstraints {
            $0.top.equalTo(mainInfoView.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.equalToSuperview()
        }

        castView.snp.makeConstraints {
            $0.top.equalTo(overviewView.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.equalToSuperview().inset(defaultInset)
            $0.height.greaterThanOrEqualTo(castCollectionViewHeight)
        }

        actorsView.snp.makeConstraints {
            $0.top.equalTo(castView.snp.bottom).offset(2 * defaultOffset)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(actorsCollectionViewHeight)
        }

        socialView.snp.makeConstraints {
            $0.top.equalTo(actorsView.snp.bottom).offset(2 * defaultOffset)
            $0.leading.trailing.equalToSuperview()
        }

        recommendationView.snp.makeConstraints {
            $0.top.equalTo(socialView.snp.bottom).offset(2 * defaultOffset)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(recommendationsCollectionViewHeight)
            $0.bottom.equalToSuperview().inset(3 * defaultOffset)
        }

        noInternetLabel.snp.makeConstraints {
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(noInternetLabelHeight)
        }
    }

}
