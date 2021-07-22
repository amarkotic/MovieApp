import UIKit

extension FavoriteMoviesViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
    }
    
    func styleViews() {
        self.view.backgroundColor = .white
    }
    
    func defineLayoutForViews() {
    }
    
    func buildNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .appBlue
        let logo = UIImage(with: .appLogo)
        let logoImageView = UIImageView(image: logo)
        navigationItem.titleView = logoImageView
    }
    
}
