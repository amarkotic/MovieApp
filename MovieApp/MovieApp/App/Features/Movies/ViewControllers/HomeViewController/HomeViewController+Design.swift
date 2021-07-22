import UIKit

extension HomeViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        searchBarStackView = SearchBarStackView()
        view.addSubview(searchBarStackView)
        
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
    }
    
    func defineLayoutForViews() {
        searchBarStackView.snp.makeConstraints {
            $0.height.equalTo(43)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
        }
       
    }

    func buildNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .appBlue
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView(image: logo)
        navigationItem.titleView = logoImageView
    }
}
