//
//  Media+CoreDataProperties.swift
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

extension Media {

    @NSManaged var url: String?
    @NSManaged var urlMedia: Sugestao?

}
