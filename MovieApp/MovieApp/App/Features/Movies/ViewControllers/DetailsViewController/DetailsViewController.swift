import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 20
    let recommendationsViewHeight = 114
    let castViewHeight = 259
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    var socialView: SocialView!
    var recommendationsView: RecommendationsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        setupNavigationBackButton()
    }
    
    func setupNavigationBackButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(with: .backButton),
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    @objc func backButtonPressed(){
        navigationController?.popViewController(animated: false)
    }
    
}
