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
        
        progressBar = UIImageView()
        addSubview(progressBar)
        
        progressLabel = UILabel(with: .medium(size: 15))
        progressBar.addSubview(progressLabel)
        
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
        
        progressBar.image = UIImage(with: .progressBar)
        
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
        
        progressBar.snp.makeConstraints {
            $0.leading.equalTo(defaultOffset + 3)
            $0.top.equalTo(progressBarTopOffset)
        }
        
        progressLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        userScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(progressBar.snp.trailing).offset(defaultOffset)
            $0.centerY.equalTo(progressBar)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(defaultOffset)
            $0.top.equalTo(progressBar.snp.bottom).offset(secondaryOffset)
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
