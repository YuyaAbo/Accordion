import UIKit

class AccordionViewController: UITableViewController {
    
    private var isOpened: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sectionHeaderHeight = 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? AccordionHeaderFooterView
        if cell == nil {
            cell = AccordionHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AccordionViewController.headerTapped(_:))))
        }
        cell!.textLabel!.text = "ヘッダー"
        cell!.section = section
        cell!.updateImage(isOpened: isOpened)
        
        return cell
    }
    
    func headerTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? AccordionHeaderFooterView else {
            return
        }
        let isOpened = self.isOpened
        self.isOpened = !isOpened
        tableView.reloadSections(IndexSet([cell.section]), with: .bottom)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isOpened ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    }
    
}
