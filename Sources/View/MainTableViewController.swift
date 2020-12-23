// Copyright 2020 @they-them.

import UIKit

final class MainTableViewController: UITableViewController {
    
    // MARK: Properties
    // Initialize data source object.
    var dataSource = DataSource()
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reinitialize the table view with grouped style.
        self.tableView = UITableView(frame: .zero, style: .grouped)
        // Call the configure UI function to set title and add bar button.
        configureUI()
    }
    
    private func configureUI() {
        // Set navigation bar title to Kara.
        title = "Kara"
        // Add "Add" button to right side of the navigation bar.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddBarButtonItemPressed(sender:)))
    }
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Number of cells that will be drawn.
        return dataSource.moods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Initialize cell with subtitle type and cell reuse identifier.
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        // Get specific mood from data source.
        let mood = dataSource.moods[indexPath.row]
        // Set top text label to the mood.
        cell.textLabel?.text = mood.type.rawValue.capitalized
        // Set bottom text label to the formatted date.
        cell.detailTextLabel?.text = Formatter.string(from: mood.createdAt)
        
        // Return the cell.
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Only accept delete editing style events.
        guard .delete == editingStyle else {
            // Exit early for everything else.
            return
        }
        
        // Remove the row/mood from the data source.
        dataSource.remove(indexPath: indexPath)
        // Reload the table view.
        self.tableView.reloadData()
    }
    
    // MARK: Actions
    @objc private func handleAddBarButtonItemPressed(sender: UIBarButtonItem) {
        // Initialize the view controller.
        let addViewController = AddViewController()
        // Pass the data source.
        addViewController.dataSource = dataSource
        // Set the delegate to self so the below function will be called.
        addViewController.delegate = self
        // Present the view controller as modal view controller.
        present(addViewController, animated: true, completion: nil)
    }
}

extension MainTableViewController: AddViewDelegate {
    func handleDismissFromAddView() {
        // This is called when AddViewController is dismissed.
        // Then it reloads the table view's data so the new item will show up.
        tableView.reloadData()
    }
}
