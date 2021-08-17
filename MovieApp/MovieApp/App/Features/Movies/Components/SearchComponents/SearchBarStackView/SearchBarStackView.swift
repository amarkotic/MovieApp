import UIKit

class SearchBarStackView: UIStackView {
    
    let defaultInset = 11
    let secondaryInset = 15
    let magnifierSize = CGSize(width: 21, height: 21)
    let cancelSize = CGSize(width: 13, height: 13)
    
    var searchBar: SearchBar!
    var cancelButton: UIButton!
    
    var delegate: MoviesSearchViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildViews()
        addTargets()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(delegate: MoviesSearchViewController) {
        self.delegate = delegate
    }
    
    func activateKeyboard() {
        didTapTextField()
        searchBar.searchTextField.becomeFirstResponder()
    }
    
    private func addTargets() {
        searchBar.searchCancelButton.addTarget(self, action: #selector(didTapSearchCancelButton), for: .touchUpInside)
        searchBar.searchTextField.addTarget(self, action: #selector(didTapTextField), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    
    @objc private func didTapSearchCancelButton() {
        setView(view: cancelButton, hidden: true)
        setView(view: searchBar.searchCancelButton, hidden: true)
        searchBar.searchTextField.text = .none
        endEditing(true)
    }
    
    @objc func didTapTextField() {
        setView(view: cancelButton, hidden: false)
        setView(view: searchBar.searchCancelButton, hidden: false)
    }
    
    @objc private func didTapCancelButton() {
        setView(view: cancelButton, hidden: true)
        setView(view: searchBar.searchCancelButton, hidden: true)
        delegate?.dismiss(animated: true, completion: nil)
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
