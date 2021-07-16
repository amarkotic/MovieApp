import UIKit

class MovieCell : UITableViewCell {

    var mainView : UIView!
    var movieImageView : UIImageView!
    var titleLabel : UILabel!
    var descriptionLabel : UILabel!
    static let cellIdentifier = "MovieCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populateCell(with movie : Movie){
        self.movieImageView.image = UIImage(named: movie.image)
        self.titleLabel.text = movie.title
        self.descriptionLabel.text = movie.description
    }

}

