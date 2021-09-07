import UIKit

class CastView: UIView {

    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 26
        return layout
    }()

    var castViewModel = [CastViewModel]()
    var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with model: [CastViewModel]) {
        castViewModel = model
        collectionView.reloadData()
    }

}

extension CastView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        castViewModel.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: CastCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? CastCollectionViewCell
        else {
            return UICollectionViewCell()
        }

        cell.setData(with: castViewModel[indexPath.row])
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let cellWidth = (frame.width - 35) / 3
        return CGSize(width: cellWidth, height: 40)
    }

}
