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

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
    }
    
}
