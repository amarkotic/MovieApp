import UIKit
import SnapKit

extension CastView: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
    }

    func styleViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CastCollectionViewCell.self,
            forCellWithReuseIdentifier: CastCollectionViewCell.reuseIdentifier
        )
        collectionView.backgroundColor = .none
    }

    func defineLayoutForViews() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
