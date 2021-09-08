import UIKit

extension SearchBar: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        magnifierImageView = UIImageView()
        addSubview(magnifierImageView)

        searchTextField = UITextField()
        addSubview(searchTextField)

        searchCancelButton = UIButton()
        addSubview(searchCancelButton)
    }

    func styleViews() {
        backgroundColor = .searchBarGray
        layer.cornerRadius = 10

        magnifierImageView.image = UIImage(with: .searchImage)

        searchTextField.textColor = .black
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: LocalizableStrings.searchBarPlaceholder.rawValue,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.appBlue]
        )

        searchCancelButton.setImage(UIImage(with: .cancelImage), for: .normal)
        searchCancelButton.isHidden = true
    }

    func defineLayoutForViews() {
        magnifierImageView.snp.makeConstraints {
            $0.size.equalTo(magnifierSize)
            $0.top.leading.equalToSuperview().offset(defaultInset)
            $0.bottom.equalToSuperview().inset(defaultInset)
        }

        searchTextField.snp.makeConstraints {
            $0.top.equalToSuperview().offset(defaultInset)
            $0.leading.equalToSuperview().offset(4 * defaultInset)
            $0.bottom.equalToSuperview().inset(defaultInset)
            $0.trailing.equalToSuperview().inset(5 * defaultInset)
        }

        searchCancelButton.snp.makeConstraints {
            $0.size.equalTo(cancelSize)
            $0.top.equalToSuperview().offset(secondaryInset)
            $0.bottom.trailing.equalToSuperview().inset(secondaryInset)
        }
    }

}
