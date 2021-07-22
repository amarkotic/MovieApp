import UIKit

extension SearchBarStackView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    
    func createViews() {
        searchView = UIView()
        addArrangedSubview(searchView)
    
        magnifierImageView = UIImageView()
        searchView.addSubview(magnifierImageView)
        searchTextField = UITextField()
        searchView.addSubview(searchTextField)
        searchCancelButton = UIButton()
        searchView.addSubview(searchCancelButton)
        
        cancelButton = UIButton()
        addArrangedSubview(cancelButton)
        
        
    }
    
    func styleViews() {
        distribution = .fillProportionally
        
        searchView.backgroundColor = .searchBarGray
        searchView.layer.cornerRadius = 10
        
        magnifierImageView.image = UIImage(with: .searchImage)
        
        searchTextField.textColor = .black
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        
        searchCancelButton.setImage(UIImage(with: .cancelImage), for: .normal)
        
        cancelButton.isHidden = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.appBlue, for: .normal)
        
    }
    
    func defineLayoutForViews() {
        
        magnifierImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 20, height: 20))
            $0.leading.equalToSuperview().offset(13)
            $0.top.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().inset(12)
        }
        
        searchTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(42)
            $0.trailing.equalToSuperview().inset(57)
            $0.bottom.equalToSuperview().inset(13)
            $0.top.equalToSuperview().offset(11)
        }
        
        searchCancelButton.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 12, height: 12))
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(15)
        }
        
    }
    
    
}
