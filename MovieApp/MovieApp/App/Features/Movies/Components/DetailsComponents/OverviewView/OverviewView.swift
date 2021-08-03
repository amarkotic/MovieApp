import UIKit

class OverviewView: UIView {
    
    var title: UILabel!
    var overview: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
}
