import UIKit
import SnapKit

extension CategoryTableViewCell: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        titleLabel = UILabel(with: .bold(size: 20))
        contentView.addSubview(titleLabel)

        scrollView = SubcategoryScrollView()
        contentView.addSubview(scrollView)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(collectionView)
    }

    func styleViews() {
        backgroundColor = .white

        titleLabel.textColor = .appBlue

        scrollView.contentInset = UIEdgeInsets(
            top: 0,
            left: CGFloat(defaultOffset),
            bottom: 0,
            right: CGFloat(defaultOffset))
        scrollView.setDelegate(delegate: self)

        collectionView.register(
            MovieCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
        collectionView.contentInset = UIEdgeInsets(
            top: 0,
            left: CGFloat(defaultOffset),
            bottom: 0,
            right: CGFloat(defaultOffset))
        collectionView.backgroundColor = .none
    }

    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalToSuperview()
        }

        scrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(secondaryOffset)
            $0.height.equalTo(scrollHeight)
        }

        collectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(scrollView.snp.bottom).offset(4 * secondaryOffset)
            $0.height.equalTo(collectionViewHeight)
        }
    }

}
