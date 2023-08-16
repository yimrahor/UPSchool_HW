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
        veritabaniKopyala()
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
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDo", ofType: ".sqlite")
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDo.sqlite")
        let fm = FileManager.default
        
        if fm.fileExists(atPath: veritabaniURL.path()){
            print("veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: veritabaniURL.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
