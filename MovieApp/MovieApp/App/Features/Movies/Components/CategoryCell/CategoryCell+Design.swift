import UIKit
import SnapKit

extension CategoryCell: DesignProtocol{
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
//        categoryTitle = UILabel()
        contentView.addSubview(titleLabel)
        
        categoryScrollView = UIScrollView()
        contentView.addSubview(categoryScrollView)
        
        categoryStackView = UIStackView()
        for i in 0..<categoryArray.count {
            categoryStackView.addArrangedSubview(categoryArray[i])
        }
        categoryScrollView.addSubview(categoryStackView)
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        titleLabel.font = UIFont.bold(size: 20)
        titleLabel.textColor = UIColor.appBlue
        
        categoryScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(defaultOffset))
        
        categoryStackView.distribution = .equalSpacing
        categoryStackView.spacing = 13
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieImageCell.self, forCellWithReuseIdentifier: MovieImageCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(defaultOffset))
        collectionView.backgroundColor = .none
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalToSuperview()
        }
        
        categoryScrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(titleLabel.snp.bottom).offset(secondaryOffset)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(scrollHeight)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.edges.height.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(categoryScrollView.snp.bottom).offset(4 * secondaryOffset)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(collectionViewCellHeight)
        }
    }
    
}


