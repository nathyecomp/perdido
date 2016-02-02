//
//  Sugestao+CoreDataProperties.swift
//  Perdido
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Perdido S.A. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Sugestao {

    @NSManaged var data: NSDate?
    @NSManaged var descricao: String?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var titulo: String?

}
