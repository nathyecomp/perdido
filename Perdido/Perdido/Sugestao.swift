//
//  Sugestao.swift
//  Perdido
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Perdido S.A. All rights reserved.
//

import Foundation
import CoreData


class Sugestao: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    // The designated initializer
    convenience init()
    {
        // get context
        let context: NSManagedObjectContext = AppDelegate.sharedInstance.managedObjectContext
        
        
        
        // create entity description
        let entityDescription: NSEntityDescription? = NSEntityDescription.entityForName("Perdido", inManagedObjectContext: context)
        
        // call super using
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        
        
    }
    

}
