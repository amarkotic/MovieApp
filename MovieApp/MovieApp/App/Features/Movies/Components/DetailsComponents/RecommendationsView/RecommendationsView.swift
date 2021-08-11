import UIKit

class RecommendationsView: UIView {
    let defaultOffset = 18
//    let secondaryOffset = 7
    let collectionViewHeight = 114
//
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 125, height: 209)
        layout.minimumInteritemSpacing = 12
        return layout
    }()
    
    var title: UILabel!
    var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RecommendationsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RecommendationCollectionViewCell.reuseIdentifier,
                for: indexPath) as? RecommendationCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}
