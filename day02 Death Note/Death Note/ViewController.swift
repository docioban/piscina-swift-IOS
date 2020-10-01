//
//  ViewController.swift
//  Death Note
//
//  Created by Macbook Pro on 10/1/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
//        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DATA.note.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! TableViewCell
        cell.name = DATA.note[indexPath.row]
        return cell
    }

    @IBAction func unwindSeque(_ sender: UIStoryboardSegue) {
        tableView.reloadData()
    }

}

