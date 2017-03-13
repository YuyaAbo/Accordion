import UIKit

class AccordionViewController: UITableViewController {
    
    private var extended: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.sectionHeaderHeight = 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as? AccordionHeaderFooterView
        if cell == nil {
            cell = AccordionHeaderFooterView(reuseIdentifier: "Header")
            cell?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(AccordionViewController.headerTapped(_:))))
        }
        cell!.textLabel!.text = "ヘッダー"
        cell!.section = section
        cell!.setExpanded(expanded: extended)
        
        return cell
    }
    
    func headerTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? AccordionHeaderFooterView else {
            return
        }
        let extended = self.extended
        self.extended = !extended
        tableView.reloadSections(IndexSet([cell.section]), with: .bottom)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return extended ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
}
