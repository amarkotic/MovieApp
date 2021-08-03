import UIKit

class DetailsViewController: UIViewController {
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    var castView: CastView!
    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }
    
}
