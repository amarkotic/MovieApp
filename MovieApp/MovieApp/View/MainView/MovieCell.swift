import UIKit

class MovieCell: UITableViewCell {

    static let reuseIdentifier = String(describing: MovieCell.self)
    let defaultInset: CGFloat = 5
    let movieImageViewWidth = 100
    
    var mainView: UIView!
    var movieImageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func populateCell(with movie: Movie){
        movieImageView.image = UIImage(named: movie.image)
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = 20
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 18, bottom: 6, right: 18))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
    }
    
}

