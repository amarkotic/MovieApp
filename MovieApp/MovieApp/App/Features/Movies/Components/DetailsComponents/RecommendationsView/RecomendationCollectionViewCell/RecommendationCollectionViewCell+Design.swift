import UIKit
import SnapKit

extension RecommendationCollectionViewCell: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        imageView = UIImageView()
        contentView.addSubview(imageView)

        title = UILabel(with: .bold(size: 16))
        contentView.addSubview(title)
    }

    func styleViews() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true

        title.textColor = .appBlue
    }

    func defineLayoutForViews() {
        imageView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(imageHeight)
        }

        title.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.equalToSuperview()
        }
    }

}
