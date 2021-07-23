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
        scrollContentView = UIView()
        categoryScrollView.addSubview(scrollContentView)
        
        categoryStackView = UIStackView()
        scrollContentView.addSubview(categoryStackView)
    }
    
    func styleViews() {
        backgroundColor = .white
        
        titleLabel.text = "What's popular"
        titleLabel.font = UIFont.bold(size: 20)
        titleLabel.textColor = UIColor.appBlue
        
        categoryStackView.distribution = .fillProportionally
        categoryStackView.spacing = 23
      
        for i in 0..<categoryArray.count {
            categoryArray[i].setTitle(temporaryCartegoryArray[i], for: .normal)
            categoryArray[i].setTitleColor(UIColor.appBlue, for: .normal)
            categoryArray[i].titleLabel?.font = UIFont.proximaMedium
            categoryStackView.addArrangedSubview(categoryArray[i])
        }
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
        
        scrollContentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
            
        }
        
        categoryStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
}


