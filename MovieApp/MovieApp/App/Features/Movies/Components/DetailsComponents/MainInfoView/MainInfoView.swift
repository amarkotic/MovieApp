import UIKit

class MainInfoView: UIView {
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let thirdOffset = 28
    
    let circularPath = UIBezierPath(
        arcCenter: CGPoint(x: 42, y: 128),
        radius: 20,
        startAngle: -CGFloat.pi/2,
        endAngle: 1.5 * CGFloat.pi,
        clockwise: true
    )
    
    var moviePoster: UIImageView!
    var backgroundProgressPath: CAShapeLayer!
    var progressBar: CAShapeLayer!
    var progressLabel: UILabel!
    var userScoreLabel: UILabel!
    var nameLabel: UILabel!
    var releaseDateLabel: UILabel!
    var genresAndDurationLabel: UILabel!
    var elipseImageView: UIImageView!
    var favoriteImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        animateProgressBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateProgressBar() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 0.76
        animation.duration = 2
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        progressBar.add(animation, forKey: "animation")
    }
    
}
