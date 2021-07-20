import UIKit

extension UIImage {
    
    convenience init?(with image: BundleImage) {
        self.init(named: image.rawValue)
    }
    
}

