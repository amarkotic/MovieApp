import UIKit

class SocialView: UIView {
    
    let defaultOffset = 16
    let secondaryOffset = 18
    let thirdOffset = 10
    
    let logoSize = CGSize(width: 56, height: 56)
    
    var title: UILabel!
    var reviewsButton: UIButton!
    var logoImage: UIImageView!
    var postTitle: UILabel!
    var postInfo: UILabel!
    var postContent: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
