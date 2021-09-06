import UIKit
import SnapKit

extension CastCollectionViewCell: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        name = UILabel(with: .bold(size: 14))
        addSubview(name)

        role = UILabel(with: .proximaMedium)
        addSubview(role)
    }

    func styleViews() {
        name.textColor = .appBlack

        role.textColor = .appBlack
    }

    func defineLayoutForViews() {
        name.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }

        role.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(defaultOffset)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }

}
