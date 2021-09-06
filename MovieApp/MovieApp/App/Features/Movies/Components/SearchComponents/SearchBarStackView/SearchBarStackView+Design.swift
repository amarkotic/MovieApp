import UIKit

extension SearchBarStackView: DesignProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        searchBar = SearchBar()
        addArrangedSubview(searchBar)

        cancelButton = UIButton()
        addArrangedSubview(cancelButton)
    }

    func styleViews() {
        distribution = .fillProportionally

        cancelButton.isHidden = true
        cancelButton.setTitle(LocalizableStrings.cancelButtonTitle.rawValue, for: .normal)
        cancelButton.setTitleColor(.appBlue, for: .normal)
    }

    func defineLayoutForViews() {
    }

}
