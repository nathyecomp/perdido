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
            try AppDelegate.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa: ", error)
        }
        
    }
    
    // delete object
    static func delete(task: Sugestao) {
        AppDelegate.sharedInstance.managedObjectContext.deleteObject(task)
        
        do {
            try AppDelegate.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao deletar tarefa: ", error)
        }
        
    }
    
    // fetch all existing objects
    static func fetchAllTasks() -> [Sugestao] {
        let request = NSFetchRequest(entityName: "Sugestao")
        request.sortDescriptors = [NSSortDescriptor(key: "data", ascending: true)]
        
        var results = [Sugestao]()
        
        do {
            results = try AppDelegate.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Sugestao]
        } catch let error as NSError {
            print("Erro ao buscar tarefas: ", error)
        }
        
        return results
        
    }
}

