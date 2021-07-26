import UIKit
import SnapKit

extension CategoryCell: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        categoryScrollView = UIScrollView()
        contentView.addSubview(categoryScrollView)
        
        categoryStackView = UIStackView()
        for i in 0..<categoryArray.count {
            categoryStackView.addArrangedSubview(categoryArray[i])
        }
        categoryScrollView.addSubview(categoryStackView)
        
        moviesScrollView = UIScrollView()
        contentView.addSubview(moviesScrollView)
        
        moviesStackView = UIStackView()
        for i in 0..<10 {
            moviesStackView.addArrangedSubview(moviesArray[i])
        }
        moviesScrollView.addSubview(moviesStackView)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        titleLabel.text = "What's popular"
        titleLabel.font = UIFont.bold(size: 20)
        titleLabel.textColor = UIColor.appBlue
        
        categoryStackView.distribution = .fillProportionally
        categoryStackView.spacing = 13
        
        moviesStackView.distribution = .fillProportionally
        moviesStackView.spacing = 8   
    }
    
    func defineLayoutForViews() {
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalToSuperview()
        }
        
        categoryScrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(22)
        }
        
        categoryStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        moviesScrollView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(categoryScrollView.snp.bottom).offset(31)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(179)
        }
        
        moviesStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
//            $0.width.equalTo(moviesArray.count * 130 - 8)
        }
        
        for i in 0..<10 {
            moviesArray[i].snp.makeConstraints {
                $0.width.equalTo(122)
            }
        }
    }
    
}


