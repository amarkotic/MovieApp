import UIKit
import SnapKit


extension MainViewController {
    
    func buildViews(){
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        movieTableView = UITableView(frame: CGRect.zero, style: .grouped)
        view.addSubview(movieTableView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
        //Navigation bar
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Color.init().customBlue
        let logo = UIImage(named: "TMDBLogo")
        let logoImageView = UIImageView(image: logo)
        self.navigationItem.titleView = logoImageView
        
        //Table view
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.backgroundColor = .white
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.cellIdentifier)
        movieTableView.rowHeight = view.frame.height / 5
        movieTableView.bounces = true
        movieTableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        movieTableView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalToSuperview()
        }
    }
}
