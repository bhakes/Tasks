//
//  TasksDetailViewController.swift
//  Tasks
//
//  Created by Benjamin Hakes on 12/18/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit

class TasksDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    private func updateViews(){
        guard isViewLoaded else {return}
        
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        notesTextView.text = task?.notes
    }
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        let notes = notesTextView.text
        
        if let task = task {
            //Editing existing task
            task.name = name
            task.notes = notes
        } else {
            // Create a new task
            _ = Task(name: name, notes: notes)
        }
        
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()
        } catch{
            NSLog("Error saving managed object context: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
