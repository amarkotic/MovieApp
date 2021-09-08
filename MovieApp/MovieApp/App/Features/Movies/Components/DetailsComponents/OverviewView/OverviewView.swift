import UIKit

class OverviewView: UIView {

    let defaultOffset = 18

    var title: UILabel!
    var overview: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with overviewModel: OverviewViewModel) {
        overview.text = overviewModel.overview
    }

}
