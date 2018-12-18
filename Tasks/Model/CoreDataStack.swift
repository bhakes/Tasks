//
//  CoreDataStack.swift
//  Tasks
//
//  Created by Benjamin Hakes on 12/18/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack{
    
    static let shared = CoreDataStack()
    private init() {}
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores{ (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var mainContext: NSManagedObjectContext{
        return container.viewContext
    }
}
