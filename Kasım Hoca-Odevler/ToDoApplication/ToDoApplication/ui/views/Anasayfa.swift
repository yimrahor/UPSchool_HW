//
//  ViewController.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonToDoDetailAct(_ sender: Any) {
        let toDo = ToDo(toDo_id: 1, toDo_name: "Go to shopping")
        performSegue(withIdentifier: "toDoDetail", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDoDetail" {
            if let toDo = sender as? ToDo {
                let gidilecekVC = segue.destination as! ToDoDetayVC
                gidilecekVC.toDo = toDo
                
            }
        }
        
        
    }
    
    
    
}

