import UIKit

class CastCollectionViewCell: UICollectionViewCell {

    let defaultOffset = 5

    static let reuseIdentifier = String(describing: CastCollectionViewCell.self)

    var name: UILabel!
    var role: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with model: CastViewModel) {
        name.text = model.name
        role.text = model.role
    }

}
