import UIKit

class SearchBarStackView: UIStackView {
    
    let defaultInset = 11
    let secondaryInset = 15
    let magnifierSize = CGSize(width: 21, height: 21)
    let cancelSize = CGSize(width: 13, height: 13)
    
    var searchView: UIView!
    var magnifierImageView: UIImageView!
    var searchTextField: UITextField!
    var searchCancelButton: UIButton!
    var cancelButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        searchCancelButton.addTarget(self, action: #selector(didTapSearchCancelButton), for: .touchUpInside)
        searchTextField.addTarget(self, action: #selector(didTapTextField), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapSearchCancelButton() {
        setView(view: cancelButton, hidden: true)
        setView(view: searchCancelButton, hidden: true)
        searchTextField.text = .none
        endEditing(true)
    }
    
    @objc func didTapTextField() {
        setView(view: cancelButton, hidden: false)
        setView(view: searchCancelButton, hidden: false)
    }
    
    @objc func didTapCancelButton() {
        setView(view: cancelButton, hidden: true)
        setView(view: searchCancelButton, hidden: true)
        endEditing(true)
    }
    
}

extension SearchBarStackView {
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.2, options: .curveEaseInOut, animations: {
            view.isHidden = hidden
        })
    }
    
}
