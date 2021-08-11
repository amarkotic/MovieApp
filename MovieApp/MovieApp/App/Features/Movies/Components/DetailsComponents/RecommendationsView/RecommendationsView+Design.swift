import UIKit
import SnapKit

extension RecommendationsView: DesignProtocol {
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        title = UILabel(with: .bold(size: 20))
        addSubview(title)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(collectionView)
    }
    
    func styleViews() {
        title.text = LocalizableStrings.recommendations.rawValue
        title.textColor = .appBlue
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            RecommendationCollectionViewCell.self,
            forCellWithReuseIdentifier: RecommendationCollectionViewCell.reuseIdentifier
        )
        collectionView.contentInset = UIEdgeInsets(top: 0, left: CGFloat(defaultOffset), bottom: 0, right: CGFloat(defaultOffset))
        collectionView.backgroundColor = .none
    }
    
    func defineLayoutForViews() {
        
        title.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(collectionViewHeight)
        }
    }
    
}
