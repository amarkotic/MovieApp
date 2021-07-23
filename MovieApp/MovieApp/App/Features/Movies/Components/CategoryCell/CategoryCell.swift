import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CategoryCell.self)
    
    var titleLabel: UILabel!
    var categoryScrollView: UIScrollView!
    var scrollContentView: UIView!
    var categoryStackView: UIStackView!
    var categoryArray = [UIButton]()
    
    //Temporary data
    let temporaryCartegoryArray = ["Streaming", "On TV", "For Rent", "In theaters", "Popular", "For rent"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createButtons()
        buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createButtons() {
        for i in 0..<temporaryCartegoryArray.count {
            categoryArray.append(UIButton())
            categoryArray[i].addTarget(self, action: #selector(button), for: .touchUpInside)
        }
    }
    
    @objc func button() {

    }
}

