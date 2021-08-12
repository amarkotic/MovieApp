import UIKit

class MainInfoView: UIView {
    
    let defaultOffset = 18
    let secondaryOffset = 8
    let thirdOffset = 31
    let moviePosterHeight = 303
    
    let circularPath = UIBezierPath(
        arcCenter: CGPoint(x: 42, y: 128),
        radius: 20,
        startAngle: -CGFloat.pi/2,
        endAngle: 1.5 * CGFloat.pi,
        clockwise: true
    )
    
    var moviePoster: UIImageView!
    var gradientView: GradientView!
    var backgroundProgressPath: CAShapeLayer!
    var progressBar: CAShapeLayer!
    var progressLabel: UILabel!
    var userScoreLabel: UILabel!
    var nameLabel: UILabel!
    var releaseDateLabel: UILabel!
    var genresAndDurationLabel: UILabel!
    var elipseImageView: UIImageView!
    var favoriteImageView: UIImageView!
    
    var progress: Float!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animateProgressBar() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = progress / 100
        animation.duration = 1.5
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        progressBar.add(animation, forKey: "animation")
    }
    
    func setData(with infoModel: MainInfoViewModel) {
        progress = infoModel.progressPercentage
        nameLabel.text = infoModel.movieName
        moviePoster.kf.setImage(with: URL(string: infoModel.posterPath))
        progressLabel.attributedText = buildAttributedPercentage(with: infoModel.progressPercentage)
        releaseDateLabel.text = buildAttributedReleseDateAndCountry(date: infoModel.releaseDate, language: infoModel.language)
        genresAndDurationLabel.attributedText = buildAttributedGenreAndDuration(genre: infoModel.genres, duration: infoModel.duration)
        
        animateProgressBar()
    }
    
    func buildAttributedPercentage(with percentage: Float) -> NSMutableAttributedString {
        let attribute: [NSAttributedString.Key: Any] = [.font: UIFont.medium(size: 9)]
        let attributedText = NSMutableAttributedString(string: "\(Int(percentage))")
        attributedText.append(NSMutableAttributedString(string: "%", attributes: attribute))
        return attributedText
    }
    
    func buildAttributedGenreAndDuration(genre: String, duration: Int) -> NSMutableAttributedString {
        let runtimeHours = duration / 60
        let runtimeMinutes = duration % 60
        
        let attribute: [NSAttributedString.Key: Any] = [.font: UIFont.bold(size: 14)]
        let genres = NSMutableAttributedString(string: genre)
        let runtime = NSMutableAttributedString(string: "\(runtimeHours)h \(runtimeMinutes)m", attributes: attribute)
        genres.append(runtime)
        return genres
    }
    
    func buildAttributedReleseDateAndCountry(date: String, language: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date!)

        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: date!)

        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: date!)
        
        let durationAndLanguage = "\(day)/\(month)/\(year) (\(language.uppercased()))"
        return durationAndLanguage
    }
    
}

