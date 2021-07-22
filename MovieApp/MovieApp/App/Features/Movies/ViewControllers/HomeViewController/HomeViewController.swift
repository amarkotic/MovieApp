import UIKit

class HomeViewController: UIViewController {
    
    var searchBarStackView: SearchBarStackView!
    var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiViewPressed))
        view.addGestureRecognizer(tap)
        
        buildNavigationBar()
    }
    
    @objc private func uiViewPressed(){
        view.endEditing(true)
    }
}
