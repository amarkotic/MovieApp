import UIKit
import SnapKit

extension MovieCollectionViewCell: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        movieImageView = UIImageView()
        contentView.addSubview(movieImageView)

        ellipseImageView = UIImageView()
        contentView.addSubview(ellipseImageView)

        heartImageView = UIImageView()
        ellipseImageView.addSubview(heartImageView)
    }

    func styleViews() {
        movieImageView.layer.cornerRadius = cornerRadius
        movieImageView.layer.masksToBounds = true
        movieImageView.contentMode = .scaleAspectFill

        ellipseImageView.image = UIImage(with: .ellipseImage)
    }

    func defineLayoutForViews() {
        movieImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        ellipseImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(defaultOffset)
            $0.size.equalTo(ellipseSize)
        }

        heartImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(heartSize)
        }
    }

}
