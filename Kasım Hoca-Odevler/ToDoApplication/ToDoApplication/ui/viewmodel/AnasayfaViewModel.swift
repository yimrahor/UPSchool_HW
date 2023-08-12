//
//  AnasayfaViewModel.swift
//  ToDoApplication
//
//  Created by Yaşar Ebru İmrahor on 11.08.2023.
//

import Foundation
import RxSwift

class AnasayfaViewModel{
    var trepo = ToDoDaoRepo()
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init() {
        toDoList = trepo.toDoList
    }
    
    func delete(toDo_id:Int){
        trepo.delete(toDo_id: toDo_id)
        toDoLoad()
    }
    
    func search(searchWord:String){
        trepo.search(searchWord: searchWord)
    }
    
    func toDoLoad(){
        trepo.toDoLoad()
    }
    
}
