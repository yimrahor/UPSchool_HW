//
//  ToDoKayitViewModel.swift
//  ToDoApplication
//
//  Created by Yaşar Ebru İmrahor on 11.08.2023.
//

import Foundation

class ToDoKayitViewModel{
    var trepo = ToDoDaoRepo()
    
    func save(toDoName:String){
        trepo.save(toDoName: toDoName)
    }
    
}
