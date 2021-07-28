import UIKit

class HomeViewController: UIViewController {
    
    let defaultInset = 20
    let searchBarHeight = 43
    let rowHeight = CGFloat(311)
    
    var searchBarStackView: SearchBarStackView!
    var tableView: UITableView!
    
    private var presenter: HomePresenter!
    
    convenience init(presenter: HomePresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setDelegate(delegate: self)
        buildViews()
        setupGestureRecognizer()
    }
    
    private func setupGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(uiViewPressed))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func uiViewPressed(){
        view.endEditing(true)
    }
    
}

extension HomeViewController: UITableViewDelegate {
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.mockData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier) as? CategoryTableViewCell
        else {
            return CategoryTableViewCell()
        }
        
        let mockedData = presenter.mockData[indexPath.row]
        cell.populateCell(title: mockedData.title, categories: mockedData.categories, movies: mockedData.movies)
        return cell
    }
    
}
