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
        
        userScoreLabel = UILabel(with: .proximaMedium)
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
        
        userScoreLabel.text = "User score"
        
        nameLabel.text = "Iron Man 1"
        
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
            $0.leading.equalTo(21)
            $0.top.equalTo(108)
        }
        
        userScoreLabel.snp.makeConstraints {
            $0.leading.equalTo(progressBar.snp.trailing).offset(8)
            $0.centerY.equalTo(progressBar)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(progressBar.snp.bottom).offset(9)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(nameLabel.snp.bottom).offset(18)
        }
        
        genresAndDurationLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.top.equalTo(releaseDateLabel.snp.bottom).offset(7)
        }
        
        elipseImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalTo(genresAndDurationLabel.snp.bottom).offset(15)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        favoriteImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    
}
