//
//  ToDoDetayViewModel.swift
//  ToDoApplication
//
//  Created by Yaşar Ebru İmrahor on 11.08.2023.
//

import Foundation

class ToDoDetayViewModel{
    var trepo = ToDoDaoRepo()
    
    func update(toDo_id: Int, toDo_name: String){
        trepo.update(toDo_id: toDo_id, toDo_name: toDo_name)
    }
    
}
