import UIKit

class SearchBar: UIView {
    
    let defaultInset = 11
    let secondaryInset = 15
    let magnifierSize = CGSize(width: 21, height: 21)
    let cancelSize = CGSize(width: 13, height: 13)
    
    var magnifierImageView: UIImageView!
    var searchTextField: UITextField!
    var searchCancelButton: UIButton!
    
    weak private var delegate: HomeViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(delegate: HomeViewController) {
        self.delegate = delegate
    }

}
