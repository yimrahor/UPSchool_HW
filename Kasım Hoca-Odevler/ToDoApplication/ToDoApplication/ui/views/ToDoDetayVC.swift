//
//  ToDoDetayVC.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import UIKit

class ToDoDetayVC: UIViewController {

    @IBOutlet weak var tfToDoName: UITextField!
    
    var toDo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = toDo{
            tfToDoName.text = t.toDo_name
        }

    }
    

    @IBAction func buttonUpdateAct(_ sender: Any) {
        if let to = tfToDoName.text, let t = toDo {
            update(toDo_id: t.toDo_id!, toDo_name: to)
        }
    }
    
    func update(toDo_id: Int, toDo_name: String){
        print("Yapılack güncellendi: \(toDo_name)")
    }
    

}
