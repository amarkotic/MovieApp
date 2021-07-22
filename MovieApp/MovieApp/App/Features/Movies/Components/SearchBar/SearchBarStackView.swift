import UIKit

class SearchBarStackView: UIStackView {
    
    var searchView: UIView!
    var magnifierImageView: UIImageView!
    var searchTextField: UITextField!
    var cancelImageView: UIImageView!
    var cancelButton: UIButton!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
