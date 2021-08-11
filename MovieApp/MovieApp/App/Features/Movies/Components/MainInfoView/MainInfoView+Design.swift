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
        moviePoster.addSubview(progressLabel)
        
        userScoreLabel = UILabel(with: .proximaSemiBold)
        moviePoster.addSubview(userScoreLabel)
        
        nameLabel = UILabel(with: .bold(size: 24))
        moviePoster.addSubview(nameLabel)
        
        releaseDateLabel = UILabel(with: .proximaMedium)
        moviePoster.addSubview(releaseDateLabel)
        
        genresAndDurationLabel = UILabel(with: .proximaMedium)
        moviePoster.addSubview(genresAndDurationLabel)
        
        elipseImageView = UIImageView()
        moviePoster.addSubview(elipseImageView)
        
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
        
        progressLabel.textColor = .appWhite
        
        userScoreLabel.text = LocalizableStrings.userScore.rawValue
        userScoreLabel.textColor = .appWhite
    
        nameLabel.textColor = .detailsGray
        
        releaseDateLabel.textColor = .appWhite

        genresAndDurationLabel.textColor = .appWhite
        
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

