import UIKit

class AccordionHeaderFooterView: UITableViewHeaderFooterView {
    
    private var arrow = UIImageView()
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrow)
        contentView.addConstraints([
            NSLayoutConstraint(item: arrow, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -8),
            NSLayoutConstraint(item: arrow, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(expanded: Bool) {
        arrow.image = UIImage(named: expanded ? "ArrowUp" : "ArrowDown")
    }
    
}
