import UIKit
import SnapKit

extension MoviesSearchViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        searchBarStackView = SearchBarStackView()
        view.addSubview(searchBarStackView)
        
        tableView = UITableView(frame: CGRect.zero, style: .grouped)
        view.addSubview(tableView)
    }
    
    func styleViews() {
        view.backgroundColor = .white

        tableView.backgroundColor = .white
        tableView.register(MovieSearchCell.self, forCellReuseIdentifier: MovieSearchCell.reuseIdentifier)
        tableView.rowHeight = rowHeight
        tableView.bounces = true
        tableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        searchBarStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultInset)
            $0.leading.trailing.equalToSuperview().inset(defaultInset)
            $0.height.equalTo(searchBarHeight)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBarStackView.snp.bottom).offset(defaultInset)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
