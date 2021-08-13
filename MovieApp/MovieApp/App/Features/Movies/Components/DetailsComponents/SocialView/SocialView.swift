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
        postTitle.text?.append(reviewModel.author)
        postInfo.attributedText = createAttributedText(author: reviewModel.author, date: reviewModel.date)
        postContent.text = reviewModel.review
    }
    
    private func createAttributedText(author: String, date: String) -> NSMutableAttributedString {
        let attribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.appBlack]
        let attributedText = NSMutableAttributedString(string: LocalizableStrings.writtenBy.rawValue)
        attributedText.append(NSMutableAttributedString(string: author, attributes: attribute))
        attributedText.append(NSMutableAttributedString(string: LocalizableStrings.on.rawValue))
        attributedText.append(NSMutableAttributedString(string: date))
        return attributedText
    }
    
}
