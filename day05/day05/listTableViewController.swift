//
//  listTableViewController.swift
//  day05
//
//  Created by Macbook Pro on 10/12/20.
//

import UIKit

class listTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.allowsSelection = true
        table.delegate = self
        table.dataSource = self
    }

    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Pins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! listTableViewCell

        cell.content.text = Pins[indexPath.row].title

        return cell
    }

    // MARK: - unwind Segue to Map
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cellSelected = table.indexPathForSelectedRow, segue.identifier == "unwindToMap" {
            let mapViewController = segue.destination as! MapViewController
            mapViewController.dataPassed = Pins[cellSelected.row]
            
        }
    }
    
    
}
