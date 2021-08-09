import UIKit
import SnapKit

extension MainInfoView: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        moviePoster = UIImageView()
        addSubview(moviePoster)

        backgroundProgressPath = CAShapeLayer()
        layer.addSublayer(backgroundProgressPath)

        progressBar = CAShapeLayer()
        layer.addSublayer(progressBar)
        
        progressLabel = UILabel(with: .medium(size: 15))
        addSubview(progressLabel)
        
        userScoreLabel = UILabel(with: .proximaSemiBold)
        addSubview(userScoreLabel)
        
        nameLabel = UILabel(with: .bold(size: 24))
        addSubview(nameLabel)
        
        releaseDateLabel = UILabel(with: .proximaMedium)
        addSubview(releaseDateLabel)
        
        genresAndDurationLabel = UILabel(with: .proximaMedium)
        addSubview(genresAndDurationLabel)
        
        elipseImageView = UIImageView()
        addSubview(elipseImageView)
        
        favoriteImageView = UIImageView()
        elipseImageView.addSubview(favoriteImageView)
    }
    
    func styleViews() {
        moviePoster.image = UIImage(with: .temporaryImage)
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.layer.masksToBounds = true
        
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

        progressLabel.text = "76%"
        
        userScoreLabel.text = LocalizableStrings.userScore.rawValue
        
        nameLabel.text = "Iron Man 1"
        nameLabel.textColor = .detailsGray
        
        releaseDateLabel.text = "05/02/2008 (US)"
        
        genresAndDurationLabel.text = "Action, Science Fiction, Adventure  2h 6m"
        
        elipseImageView.image = UIImage(with: .ellipseImage)
        
        favoriteImageView.image = UIImage(with: .favoriteDetails)
    }
    
    func defineLayoutForViews() {
        moviePoster.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        progressLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(thirdOffset)
            $0.top.equalToSuperview().offset(15 * secondaryOffset + 1) 
        }
        
        userScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(progressLabel.snp.trailing).offset(2 * secondaryOffset)
            $0.centerY.equalTo(progressLabel)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalTo(progressLabel.snp.bottom).offset(3 * secondaryOffset)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalTo(nameLabel.snp.bottom).offset(defaultOffset)
        }
        
        genresAndDurationLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalTo(releaseDateLabel.snp.bottom).offset(secondaryOffset)
        }
        
        elipseImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(genresAndDurationLabel.snp.bottom).offset(defaultOffset)
            $0.bottom.equalToSuperview().inset(defaultOffset)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
}
