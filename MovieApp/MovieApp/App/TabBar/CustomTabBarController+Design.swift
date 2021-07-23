import UIKit

extension CustomTabBarController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
    }
    
    func styleViews() {
        tabBar.barTintColor = .white
        tabBar.tintColor = .appBlue
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.appBlack.cgColor
        tabBar.layer.shadowOpacity = 0.05
    }
    
    func defineLayoutForViews() {
    }

}

