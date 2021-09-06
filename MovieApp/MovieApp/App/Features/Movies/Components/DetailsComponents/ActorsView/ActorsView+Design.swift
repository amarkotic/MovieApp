import UIKit
import SnapKit

extension ActorsView: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        title = UILabel(with: .bold(size: 20))
        addSubview(title)

        fullCastButton = UIButton()
        addSubview(fullCastButton)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
    }

    func styleViews() {
        isUserInteractionEnabled = true

        title.text = LocalizableStrings.topBilledCast.rawValue
        title.textAlignment = .left
        title.textColor = .appBlue

        fullCastButton.setTitle(LocalizableStrings.fullCast.rawValue, for: .normal)
        fullCastButton.setTitleColor(.appBlue, for: .normal)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ActorsCollectionViewCell.self,
                                forCellWithReuseIdentifier: ActorsCollectionViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: CGFloat(defaultOffset),
                                                   bottom: 0,
                                                   right: CGFloat(defaultOffset))
        collectionView.backgroundColor = .none
    }

    func defineLayoutForViews() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(secondaryOffset)
            $0.leading.equalToSuperview().offset(defaultOffset)
        }

        fullCastButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(defaultOffset)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(collectionViewHeight)
        }
    }

}
