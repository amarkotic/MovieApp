import UIKit
import SnapKit

extension ProgressView {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        backgroundProgressPath = CAShapeLayer()
        layer.addSublayer(backgroundProgressPath)

        progressBar = CAShapeLayer()
        layer.addSublayer(progressBar)

        progressLabel = UILabel(with: .medium(size: 15))
        addSubview(progressLabel)
    }
    
    func styleViews() {
        backgroundProgressPath.path = circularPath.cgPath
        backgroundProgressPath.fillColor = .none
        backgroundProgressPath.strokeColor = UIColor.appGray.cgColor
        backgroundProgressPath.lineWidth = 3

        progressBar.path = circularPath.cgPath
        progressBar.fillColor = .none
        progressBar.strokeColor = UIColor.green.cgColor
        progressBar.lineWidth = 3
        progressBar.lineCap = CAShapeLayerLineCap.round
        progressBar.strokeEnd = 0

        progressLabel.textColor = .appWhite
    }
    
    func defineLayoutForViews() {
        progressLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
