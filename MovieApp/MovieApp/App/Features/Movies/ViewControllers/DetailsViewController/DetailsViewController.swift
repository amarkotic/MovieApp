import UIKit

class DetailsViewController: UIViewController {
    
    var mainInfoView: MainInfoView!
    var overviewView: OverviewView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
    }
    
}
