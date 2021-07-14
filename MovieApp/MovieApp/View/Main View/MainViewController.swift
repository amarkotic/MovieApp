import UIKit

class MainViewController: UIViewController {

    private let mainViewPresenter = MainViewPresenter(dataService: MovieDataService())
    
    var logoImageView : UIImageView!
    var movieTableView : UITableView!
    var movieArray = [Movie]()
    
    private var router : AppRouter!
    convenience init(router: AppRouter){
        self.init()
        self.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewPresenter.setMainViewDelegate(mainViewDelegate: self)
        movieArray = mainViewPresenter.fetchMovies()
        buildViews()
    }
}

//Table View Delegate Methods
extension MainViewController : UITableViewDelegate {
    
    //Highlight tapped row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MovieCell
        cell?.mainView.backgroundColor = .gray
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            cell?.mainView.backgroundColor = .white
        }
    }
}


//Table View Data Source Methods
extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier) as! MovieCell
        cell.populateCell(with: movieArray[indexPath.row])
        //Enables custom action for cell tap
        cell.selectionStyle = .none
        return cell
    }
}
