import UIKit

class HomeViewController: UIViewController {
    
    let defaultInset = 20
    let searchBarHeight = 43
    let rowHeight = CGFloat(311)
    
    var searchBarStackView: SearchBarStackView!
    var tableView: UITableView!
    var model = [CategoryViewModel]()
    
    private var presenter: HomePresenter!
    
    convenience init(presenter: HomePresenter) {
        self.init()
        
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setDelegate(delegate: self)
        setModel()
        buildViews()
        setupGestureRecognizer()
    }
    
    func subcategoryPressed(category: String, title: String) {
        print("You selected item: \(category) from category: \(title)")
        presenter.fetchMovies(title: title, category: category)
        setModel()
        tableView.reloadData()
    }
    
    private func setModel() {
        model = presenter.mockData
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
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reuseIdentifier) as? CategoryTableViewCell
        else {
            return CategoryTableViewCell()
        }
        
        cell.set(delegate: self)
        
        let data = model[indexPath.row]
        cell.populateCell(title: data.title, categories: data.categories, movies: data.movies)
        return cell
    }
    
}
