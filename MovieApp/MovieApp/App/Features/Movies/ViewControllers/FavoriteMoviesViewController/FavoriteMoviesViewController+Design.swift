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
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.bottom.equalToSuperview()
        }
    }

}
