import UIKit
import Kingfisher

class MainInfoView: UIView {

    let defaultOffset = 18
    let secondaryOffset = 8
    let thirdOffset = 31
    let progressBarSize = CGSize(width: 42, height: 42)
    let moviePosterHeight = 303

    var moviePoster: UIImageView!
    var gradientView: GradientView!
    var progressView: ProgressView!
    var userScoreLabel: UILabel!
    var nameLabel: UILabel!
    var releaseDateLabel: UILabel!
    var genresAndDurationLabel: UILabel!
    var elipseImageView: UIImageView!
    var favoriteImageView: UIImageView!
    var url: String!
    var firstLoad = true

    weak private var delegate: DetailsViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
        enableInteraction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with model: MainInfoViewModel) {
        url = model.posterPath
        favoriteImageView.image = model.isFavorite ? UIImage(with: .favoriteLogoSelected) : UIImage(with: .favoriteLogo)
        moviePoster.kf.setImage(with: URL(string: model.posterPath))
        if firstLoad {
            progressView.setData(with: model.progressPercentage)
            firstLoad = false
        }
        nameLabel.attributedText = buildAttributed(name: model.movieName, date: model.releaseDate)
        releaseDateLabel.text = buildAttributed(date: model.releaseDate, language: model.language)
        genresAndDurationLabel.attributedText = buildAttributed(genre: model.genres, duration: model.duration)
    }

    func setDelegate(delegate: DetailsViewController) {
        self.delegate = delegate
    }

    private func enableInteraction() {
        elipseImageView.isUserInteractionEnabled = true
        elipseImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteTapped)))
    }

    @objc private func favoriteTapped() {
        delegate?.favoritePressed(with: url)
    }

}

extension MainInfoView {

    private func buildAttributed(name: String, date: String) -> NSMutableAttributedString {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date!)

        let attribute: [NSAttributedString.Key: Any] = [.font: UIFont.medium(size: 24)]
        let attributedName = NSMutableAttributedString(string: name)
        let attributedYear = NSMutableAttributedString(string: " (\(year))", attributes: attribute)
        attributedName.append(attributedYear)
        return attributedName
    }

    private func buildAttributed(date: String, language: String) -> String {
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

    private func buildAttributed(genre: String, duration: Int) -> NSMutableAttributedString {
        let runtimeHours = duration / 60
        let runtimeMinutes = duration % 60

        let attribute: [NSAttributedString.Key: Any] = [.font: UIFont.bold(size: 14)]
        let genres = NSMutableAttributedString(string: genre)
        let runtime = NSMutableAttributedString(string: " \(runtimeHours)h \(runtimeMinutes)m", attributes: attribute)
        genres.append(runtime)
        return genres
    }

}
