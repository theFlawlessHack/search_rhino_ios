//  Created by Jessica Joseph on 7/19/18.
//  Copyright © 2018 B0RN BKLYN. All rights reserved.

import UIKit

class ViewController: UIViewController {

    // MARK : Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK : Variables
    var emojis: [Emoji] = []
    var searchController  = UISearchController()
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup variables and views
        
        setupEmojis()
        setupSearchView()
        
        // setup tableview datasource and delegate
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupEmojis() {
        let path = Bundle.main.path(forResource: "Emoji", ofType: "plist") as! String
        let dictionary = NSDictionary(contentsOfFile: path)
        
        for (key, value) in dictionary! {
            let emoji = Emoji(name: (key as? String)!, emojiLiteral: (value as? String)!)
            emojis.append(emoji)
        }
    }
    
    func setupSearchView() {
        searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
    }
}

// MARK : TableView Datasource and Delegate Functions
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath)
        cell.textLabel?.text = emojis[indexPath.row].emojiLiteral
        return cell
    }
    
}

// MARK : Search Result Updater Function
extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // code
    }
}
