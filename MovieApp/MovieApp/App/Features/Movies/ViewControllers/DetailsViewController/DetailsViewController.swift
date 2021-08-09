import UIKit

class DetailsViewController: UIViewController {
    
    let defaultOffset = 20
    
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    var socialView: SocialView!
    var recommendationView: RecommendationsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }

}
