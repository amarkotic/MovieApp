import UIKit
import SnapKit

extension CategoryTableViewCell: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
//        categoryTitle = UILabel()
        contentView.addSubview(titleLabel)
        
        scrollView = UIScrollView()
        contentView.addSubview(scrollView)
        
        stackView = UIStackView()
        categoryArray.forEach { stackView.addArrangedSubview($0) }
        scrollView.addSubview(stackView)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        titleLabel.font = .bold(size: 20)
        titleLabel.textColor = .appBlue
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(defaultOffset))
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 13
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(defaultOffset))
        collectionView.backgroundColor = .none
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(titleLabel.snp.bottom).offset(secondaryOffset)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(scrollHeight)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(scrollView.snp.bottom).offset(4 * secondaryOffset)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(collectionViewCellHeight)
        }
    }
    
}


