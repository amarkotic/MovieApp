import UIKit
import SnapKit

extension DetailsViewController: DesignProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        mainInfoView = MainInfoView()
        view.addSubview(mainInfoView)
        
        overviewView = OverviewView()
        view.addSubview(overviewView)
    }
    
    func styleViews() {
        view.backgroundColor = .white
    }
    
    func defineLayoutForViews() {
        mainInfoView.snp.makeConstraints{
            $0.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(303)
        }
        
        overviewView.snp.makeConstraints {
            $0.top.equalTo(mainInfoView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(18)
        }
        
    }
    
}
