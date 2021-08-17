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
        
        gradientView = GradientView()
        moviePoster.addSubview(gradientView)

        progressView = ProgressView()
        moviePoster.addSubview(progressView)
        
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
        moviePoster.contentMode = .scaleAspectFill
        moviePoster.layer.masksToBounds = true
        moviePoster.isUserInteractionEnabled = true

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
            $0.height.equalTo(moviePosterHeight)
        }
        
        gradientView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        progressView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset + 3)
            $0.top.equalToSuperview().offset(6 * defaultOffset)
            $0.size.equalTo(progressBarSize)
        }

        userScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(progressView.snp.trailing).offset(secondaryOffset)
            $0.centerY.equalTo(progressView)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalTo(progressView.snp.bottom).offset(secondaryOffset)
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

