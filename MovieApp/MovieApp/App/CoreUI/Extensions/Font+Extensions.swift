import UIKit

extension UIFont {
    
    static let proximaBold: UIFont = .bold(size: 16)
    static let proximaMedium: UIFont = .medium(size: 14)
    static let proximaSemiBold: UIFont  = .semiBold(size: 14)
    
    static func bold(size: CGFloat = 12) -> UIFont {
        UIFont(with: "ProximaNova-Bold", size: size)
    }
    
    static func medium(size: CGFloat = 12) -> UIFont {
        UIFont(with: "ProximaNova-Medium", size: size)
    }
    
    static func semiBold(size: CGFloat = 12) -> UIFont {
        UIFont(with: "ProximaNova-Semibold", size: size)
    }
    
    convenience init(with bundleFont: String, size: CGFloat ) {
        self.init(name: bundleFont, size: size)!
    }

}
