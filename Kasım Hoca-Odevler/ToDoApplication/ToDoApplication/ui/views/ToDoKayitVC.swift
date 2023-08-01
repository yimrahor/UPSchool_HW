//
//  ToDoKayıtVC.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import UIKit

class ToDoKayitVC: UIViewController {
    
    @IBOutlet weak var tfToDoName: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonSaveAct(_ sender: Any) {
        if let doName = tfToDoName.text {
            save(toDoName: doName)
        }
    }
    
    
    func save(toDoName:String){
        print("Yapılacak kaydedildi: \(toDoName)")
    }
    
}
