//
//  ToDoDaoRepo.swift
//  ToDoApplication
//
//  Created by Yaşar Ebru İmrahor on 11.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepo{
    
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    func save(toDoName:String){
        print("Yapılacak kaydedildi: \(toDoName)")
    }
    
    func update(toDo_id: Int, toDo_name: String){
        print("Yapılacak güncellendi: \(toDo_name)")
    }
    
    func delete(toDo_id:Int){
        print("Yapılacak silindi: \(toDo_id)")
    }
    
    func search(searchWord:String){
        print("Yapılacak ara: \(searchWord)")
    }
    
    func toDoLoad(){
        var list = [ToDo]()
        
        let t1 = ToDo(toDo_id: 1, toDo_name: "Go to shopping")
        let t2 = ToDo(toDo_id: 2, toDo_name: "Have lunch with Maria on Wednesday")
        let t3 = ToDo(toDo_id: 3, toDo_name: "Develop a new feature for this app")
        let t4 = ToDo(toDo_id: 4, toDo_name: "Analyze the survey results")
        
        list.append(t1)
        list.append(t2)
        list.append(t3)
        list.append(t4)
        
        toDoList.onNext(list) 
    }
    
}
