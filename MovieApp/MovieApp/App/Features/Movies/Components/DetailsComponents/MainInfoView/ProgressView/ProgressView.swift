import UIKit

class ProgressView: UIView {

    let circularPath = UIBezierPath(
        arcCenter: CGPoint(x: 21, y: 21),
        radius: 20,
        startAngle: -CGFloat.pi/2,
        endAngle: 1.5 * CGFloat.pi,
        clockwise: true
    )

    var backgroundProgressPath: CAShapeLayer!
    var progressBar: CAShapeLayer!
    var progressLabel: UILabel!

    var percentage: Float!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with percentage: Float) {
        self.percentage = percentage
        progressLabel.attributedText = buildAttributed(percentage: percentage)
        animateProgressBar()
    }

    private func animateProgressBar() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = percentage / 100
        animation.duration = 1.5
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        progressBar.add(animation, forKey: "animation")
    }

    private func buildAttributed(percentage: Float) -> NSMutableAttributedString {
        let attribute: [NSAttributedString.Key: Any] = [.font: UIFont.medium(size: 9)]
        let attributedText = NSMutableAttributedString(string: "\(Int(percentage))")
        attributedText.append(NSMutableAttributedString(string: "%", attributes: attribute))
        return attributedText
    }

}
