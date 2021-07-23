import UIKit

class HomeViewController: UIViewController {
    
    let defaultInset = 20
    let searchBarHeight = 43
    var searchBarStackView: SearchBarStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        setupGestureRecognizer()
    }
    
    private func setupGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiViewPressed))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func uiViewPressed(){
        view.endEditing(true)
    }
}
