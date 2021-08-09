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
    }

}
