//
//  RealmManager.swift
//  eduFlix
//
//  Created by Reya on 14.04.22.
//

import Foundation
import RealmSwift


class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    
    // published  var will allow to notify the views of any changes in this class
    
    @Published private(set) var tasks: [Task] = []

    init()
    {
        openRealm()
        getToDos()
    }
    func openRealm(){
        
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
           localRealm =  try Realm()
            
            
        } catch {
            print(error)
        }
    }
    // MARK: ADD TODO
    func addTask(taskName: String) {
        
        //dont run code if optional realm has no value
        if let localRealm = localRealm {
            do {
                try localRealm.write{
                    let newTask = Task(value: ["title": taskName, "completed": false])
                    localRealm.add(newTask)
                    getToDos()
                    print("added new todo to realm: \(newTask)")
                }
                
            } catch {
                print(error)
            }
        }
    }
    
    func getToDos(){
        
        if let localRealm = localRealm {
           let allTodos = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTodos.forEach { task in
                tasks.append(task)
                
            }
            
        }
    }
    
    // MARK: Update todo
    func updateTodo(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                //filter all todos and only return todo with the specified ID
                let todoToUpdate =  localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !todoToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    todoToUpdate[0].completed = completed
                    getToDos()
                    print("completed")
                }
            
            } catch {
                print("error updating todo \(id) to realm: \(error)")
            }
        }
    }
    
    // MARK: DELETE TODO
    func deleteTodo(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let todoToDelete =  localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !todoToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(todoToDelete)
                    
                    getToDos()
                    print("deleted task \(id)")
                }
                
            } catch {
                print("error deleting \(error)")
            }
        }
    }
    
}
