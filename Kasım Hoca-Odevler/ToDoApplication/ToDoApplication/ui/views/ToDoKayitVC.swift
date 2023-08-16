//
//  ToDoKayıtVC.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import UIKit

class ToDoKayitVC: UIViewController {
    
    @IBOutlet weak var tfToDoName: UITextField!
    
    var viewModel = ToDoKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func buttonSaveAct(_ sender: Any) {
        if let doName = tfToDoName.text {
            viewModel.save(toDo_name: doName)
        }
    }
    
}
