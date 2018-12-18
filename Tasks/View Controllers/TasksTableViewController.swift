//
//  TasksTableViewController.swift
//  Tasks
//
//  Created by Benjamin Hakes on 12/18/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }
    
    // this is a variable with a computed property
    var tasks: [Task] {
        
        // we should really only fetch this when the data changes
        // right now this is getting fetched every time
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching tasks: \(error)")
            return []
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)

        let task = tasks[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = task.name

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destination as! TasksDetailViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                detailVC.task = tasks[indexPath.row]
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        let task = tasks[indexPath.row]
        
        let moc = CoreDataStack.shared.mainContext
        
        moc.delete(task)
        tableView.reloadData()
        
    }

}
