import UIKit

extension HomeViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        searchBar = SearchBar()
        view.addSubview(searchBar)
        
        tableView = UITableView()
        view.addSubview(tableView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.rowHeight = rowHeight
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .none
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier)
        tableView.bounces = true
        tableView.keyboardDismissMode = .onDrag
    }
    
    func defineLayoutForViews() {
        searchBar.snp.makeConstraints {
            $0.height.equalTo(searchBarHeight)
            $0.leading.trailing.equalToSuperview().inset(defaultInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultInset)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(defaultInset)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
