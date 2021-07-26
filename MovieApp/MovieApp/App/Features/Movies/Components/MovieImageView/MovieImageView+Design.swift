import UIKit
import SnapKit

extension MovieImageView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        ellipseImageView = UIImageView()
        addSubview(ellipseImageView)
        
        heartImageView = UIImageView()
        ellipseImageView.addSubview(heartImageView)
    }
    
    func styleViews() {
        ellipseImageView.image = UIImage(with: .ellipseImage)
        heartImageView.image = UIImage(with: .heartEmpty)
    }
    
    func defineLayoutForViews() {
        ellipseImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(defaultOffset)
            $0.size.equalTo(ellipseSize)
        }
        
        heartImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(heartSize)
        }
    }

}
