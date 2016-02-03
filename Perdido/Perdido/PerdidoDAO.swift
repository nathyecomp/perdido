//
//  PerdidoDAO.swift
//  Perdido
//
//  Created by Student on 2/2/16.
//  Copyright © 2016 Perdido S.A. All rights reserved.
//

import Foundation
import CoreData

class PerdidoDAO {
    
    // TODO:
    
    // insert new object
    static func insert(task: Sugestao) {
        AppDelegate.sharedInstance.managedObjectContext.insertObject(task)
        
        do {
            try AppDelegate.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao inserir tarefa: ", error)
        }
        
    }
    
    // update existing object
    static func update(task: Sugestao) {
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa: ", error)
        }
        
    }
    
    // delete object
    static func delete(task: Task) {
        DatabaseManager.sharedInstance.managedObjectContext.deleteObject(task)
        
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao deletar tarefa: ", error)
        }
        
    }
    
    // fetch all existing objects
    static func fetchAllTasks() -> [Task] {
        let request = NSFetchRequest(entityName: "Task")
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        var results = [Task]()
        
        do {
            results = try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Task]
        } catch let error as NSError {
            print("Erro ao buscar tarefas: ", error)
        }
        
        return results
        
    }
}

