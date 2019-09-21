//
//  ViewController.swift
//  TodoList
//
//  Created by Karthik on 20/09/19.
//  Copyright © 2019 Karthik. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var items = [String]()
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
      //  cell.textLabel?.textAlignment = .center
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a new item", message: "", preferredStyle: .alert)
        var tf = UITextField()
        let action = UIAlertAction(title: "Add item", style: .default
        ) { (action) in
            if tf.text == "" {
                return
            }
            self.items.append(tf.text!)
            self.tableView.reloadData()
        }
        alert.addTextField {
            tf1 in
            tf1.placeholder = "Enter"
            tf = tf1
        }
        alert.addAction(action)
         present(alert,animated: true,completion: nil)
    }
}

