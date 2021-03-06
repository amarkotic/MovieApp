import UIKit

class SocialView: UIView {

    let defaultOffset = 16
    let secondaryOffset = 18
    let thirdOffset = 10

    let logoSize = CGSize(width: 56, height: 56)

    var title: UILabel!
    var reviewsButton: UIButton!
    var logoImage: UIImageView!
    var postTitle: UILabel!
    var postInfo: UILabel!
    var postContent: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with reviewModel: SocialViewModel) {
        let parsedDate: String
        if let date = reviewModel.date {
            parsedDate = parse(date: date)
        } else {
            parsedDate = LocalizableStrings.unknownDate.rawValue
        }

        postTitle.text?.append(reviewModel.author.username)
        postInfo.attributedText = createAttributed(author: reviewModel.author.username, date: parsedDate)
        postContent.text = reviewModel.review
        if let avatarPath = reviewModel.author.avatarPath {
            logoImage.kf.setImage(with: URL(string: String(avatarPath.dropFirst())))
        } else {
            logoImage.image = UIImage(with: .noReview)
        }
    }

}

extension SocialView {

    private func createAttributed(author: String, date: String) -> NSMutableAttributedString {
        let attribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.appBlack]
        let attributedText = NSMutableAttributedString(string: LocalizableStrings.writtenBy.rawValue)
        attributedText.append(NSMutableAttributedString(string: author, attributes: attribute))
        attributedText.append(NSMutableAttributedString(string: LocalizableStrings.on.rawValue))
        attributedText.append(NSMutableAttributedString(string: date))
        return attributedText
    }

    private func parse(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: date!)

        dateFormatter.dateFormat = "LLLL"
        let month = dateFormatter.string(from: date!)

        dateFormatter.dateFormat = "dd"
        let day = dateFormatter.string(from: date!)

        let dateString = "\(month) \(day), \(year)"
        return dateString
    }

}
