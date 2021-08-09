import UIKit
import SnapKit

extension SocialView: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        title = UILabel(with: .bold(size: 20))
        addSubview(title)
        
        reviewsButton = UIButton()
        addSubview(reviewsButton)
        
        logoImage = UIImageView(image: UIImage(with: .reviewImage))
        addSubview(logoImage)
        
        postTitle = UILabel(with: .bold(size: 18))
        addSubview(postTitle)
        
        postInfo = UILabel(with: .proximaMedium)
        addSubview(postInfo)
        
        postContent = UILabel(with: .proximaMedium)
        addSubview(postContent)
    }
    
    func styleViews() {
        title.textColor = .appBlue
        title.text = LocalizableStrings.social.rawValue
        
        reviewsButton.setTitleColor(.appBlack, for: .normal)
        reviewsButton.setTitle(LocalizableStrings.reviews.rawValue, for: .normal)
        
        logoImage.contentMode = .scaleToFill
        logoImage.layer.cornerRadius = 28
        logoImage.clipsToBounds = true

        
        postTitle.textColor = .appBlack
        postTitle.text = "A review by The Peruvian Post"
        
        postInfo.textColor = .appGray
        postInfo.numberOfLines = 0
        postInfo.text = "Written by The Peruvian Post on February 17, 2020"
        
        postContent.textColor = .appGray
        postContent.numberOfLines = 0
        postContent.text = "When director Jon Favreau and Sarah Halley cast Robert Downey Jr, they glimpsed something magnificent: a more-than-skilled actor who faultlessly portrayed the role of Tony Stark. Despite Favreau's initial decision in choosing a fresh face, he ended up delighted due to his charismatic, natural and comfortable attitude. He did not realise it yet, but he was moulding with the right measures a whole superhero cinematic universe which lasted until today and still goes for more. The filmmakers took the proper time to introduce a character whose production was undecided since New Line Pictures argu..."
    }
    
    func defineLayoutForViews() {
        
        title.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(secondaryOffset)
            $0.top.equalToSuperview()
        }
        
        reviewsButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(secondaryOffset)
            $0.top.equalTo(title.snp.bottom).offset(defaultOffset)
        }
        
        logoImage.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(defaultOffset)
            $0.top.equalTo(reviewsButton.snp.bottom).offset(2 * defaultOffset)
            $0.size.equalTo(logoSize)
        }
        
        postTitle.snp.makeConstraints {
            $0.leading.equalTo(logoImage.snp.trailing).offset(defaultOffset)
            $0.top.equalTo(reviewsButton.snp.bottom).offset(2 * defaultOffset)
            $0.trailing.equalToSuperview().inset(defaultOffset)
        }
        
        postInfo.snp.makeConstraints {
            $0.leading.equalTo(logoImage.snp.trailing).offset(secondaryOffset)
            $0.top.equalTo(postTitle.snp.bottom).offset(thirdOffset)
            $0.trailing.equalToSuperview().inset(4 * defaultOffset)
        }
        
        postContent.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(secondaryOffset)
            $0.top.equalTo(logoImage.snp.bottom).offset(3 * thirdOffset)
            $0.bottom.equalToSuperview()
        }
        
    }
    
    
}
