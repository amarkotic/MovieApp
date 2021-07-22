import UIKit

class HomeViewController: UIViewController {
    
    var searchBarStackView: SearchBarStackView!
    var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        buildNavigationBar()
    }
    
}
