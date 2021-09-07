import UIKit

extension FavoriteMoviesViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        titleLabel = UILabel(with: .bold(size: 20))
        view.addSubview(titleLabel)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
    }
    
    func styleViews() {
        self.view.backgroundColor = .white
        
        titleLabel.textColor = .appBlue
        titleLabel.text = LocalizableStrings.favorites.rawValue
        
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .none
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(2 * defaultOffset)
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(defaultOffset)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension FavoriteMoviesViewController {
    
    var layout: UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(120),
            heightDimension: .absolute(154))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(154))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 35
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
