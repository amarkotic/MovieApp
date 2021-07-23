import UIKit
import SnapKit

extension MoviesViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        view.addSubview(tableView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseIdentifier)
        tableView.rowHeight = rowHeight
        tableView.bounces = true
        tableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
