import UIKit

extension HomeViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        searchBarStackView = SearchBarStackView()
        view.addSubview(searchBarStackView)
        
        tableView = UITableView()
        view.addSubview(tableView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 311
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .none
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseIdentifier)
        tableView.bounces = true
    }
    
    func defineLayoutForViews() {
        searchBarStackView.snp.makeConstraints {
            $0.height.equalTo(searchBarHeight)
            $0.leading.trailing.equalToSuperview().inset(defaultInset)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultInset)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBarStackView.snp.bottom).offset(defaultInset)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
