//
//  Task+Convenience.swift
//  Tasks
//
//  Created by Benjamin Hakes on 12/18/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    convenience init(name: String,
                     notes: String? = nil,
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext){
        
        self.init(context: context)
        self.name = name
        self.notes = notes
        
    }
}
