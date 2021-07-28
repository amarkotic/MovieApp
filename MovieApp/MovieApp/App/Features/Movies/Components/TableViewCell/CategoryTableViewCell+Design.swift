import UIKit
import SnapKit

extension CategoryTableViewCell: DesignProtocol{

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        scrollView = UIScrollView()
        contentView.addSubview(scrollView)
        
        stackView = UIStackView()
        scrollView.addSubview(stackView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionViewCellWidth, height: collectionViewCellHeight)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        titleLabel.text = "What's popular"
        titleLabel.font = .bold(size: 20)
        titleLabel.textColor = .appBlue
        
        stackView.distribution = .fillProportionally
        stackView.spacing = 13
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
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


