import UIKit

class DetailsPresenter {

    weak private var delegate: DetailsViewController?
    
    func setDelegate(delegate: DetailsViewController?) {
        self.delegate = delegate
    }
    
    func fetchData() {
        delegate?.setData(with: MovieDetailsViewModel())
    }
    
}
