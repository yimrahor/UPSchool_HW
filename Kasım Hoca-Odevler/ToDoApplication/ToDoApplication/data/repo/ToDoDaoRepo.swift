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
    let db:FMDatabase?
    
    init(){
        let dosyaYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: dosyaYolu).appendingPathComponent("toDo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func save(toDo_name:String){
        db?.open()
        do{
            try db!.executeUpdate("INSERT INTO toDo (toDo_name) VALUES (?)", values: [toDo_name])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func update(toDo_id: Int, toDo_name: String){
        db?.open()
        do{
            try db!.executeUpdate("UPDATE toDo SET toDo_name = ? WHERE toDo_id = ?", values: [toDo_name,toDo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func delete(toDo_id:Int){
        db?.open()
        do{
            try db!.executeUpdate("DELETE FROM toDo WHERE toDo_id = ?", values: [toDo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func search(searchWord:String){
        db?.open()
        var list = [ToDo]()
        do {
            let result = try db!.executeQuery("SELECT * FROM toDo WHERE toDo_name like '%\(searchWord)%'", values: nil)
            while result.next() {
                let toDo_id = Int(result.string(forColumn: "toDo_id"))!
                let toDo_name = result.string(forColumn: "toDo_name")!
                let td = ToDo(toDo_id: toDo_id, toDo_name: toDo_name)
                list.append(td)
            }
            toDoList.onNext(list)  //Tetikleme
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
    func toDoLoad(){
        db?.open()
        var list = [ToDo]()
        do {
            let result = try db!.executeQuery("SELECT * FROM toDo", values: nil)
            while result.next() {
                let toDo_id = Int(result.string(forColumn: "toDo_id"))!
                let toDo_name = result.string(forColumn: "toDo_name")!
                let td = ToDo(toDo_id: toDo_id, toDo_name: toDo_name)
                list.append(td)
            }
            toDoList.onNext(list)  //Tetikleme
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}
