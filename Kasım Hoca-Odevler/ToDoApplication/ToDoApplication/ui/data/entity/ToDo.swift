//
//  ToDo.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import Foundation


class ToDo{
    var toDo_id: Int?
    var toDo_name:String?
    
    init(){
        
    }
    
    init(toDo_id: Int, toDo_name: String) {
        self.toDo_id = toDo_id
        self.toDo_name = toDo_name
    }
    
}
