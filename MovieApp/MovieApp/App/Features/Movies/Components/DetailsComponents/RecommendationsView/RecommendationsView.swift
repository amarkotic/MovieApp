import UIKit

class RecommendationsView: UIView {

    let defaultOffset = 18
    let collectionViewHeight = 154

    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 180, height: 114)
        layout.minimumInteritemSpacing = 12
        return layout
    }()

    var title: UILabel!
    var collectionView: UICollectionView!

    var recommendations = [RecommendationsViewModel]()

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with recommendationsModel: [RecommendationsViewModel]) {
        recommendations = recommendationsModel
        collectionView.reloadData()
    }

}

extension RecommendationsView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendations.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendationCollectionViewCell.reuseIdentifier,
                for: indexPath) as? RecommendationCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.setData(with: recommendations[indexPath.row])
        return cell
    }

}
