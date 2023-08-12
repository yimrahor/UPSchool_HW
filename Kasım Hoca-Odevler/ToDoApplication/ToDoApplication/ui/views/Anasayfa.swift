//
//  ViewController.swift
//  ToDoApplication
//
//  Created by imrahor on 1.08.2023.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var todoList = [ToDo]()
    var viewModel = AnasayfaViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        _ = viewModel.toDoList.subscribe(onNext: { list in
            self.todoList = list
            self.todoTableView.reloadData()
        })
    }
                                         
    override func viewWillAppear(_ animated: Bool) {
        viewModel.toDoLoad()
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


extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchWord: searchText)
    }
}


extension Anasayfa:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let td = todoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoHucre") as! TodoHucre
        cell.labelTodoName.text = td.toDo_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let td = todoList[indexPath.row]
        performSegue(withIdentifier: "toDoDetail", sender: td)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, bool in
            let td = self.todoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Delete \"\(td.toDo_name!)\" ? ", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            let okAction = UIAlertAction(title: "OK", style: .destructive) { action in
                self.viewModel.delete(toDo_id: td.toDo_id!)
            }
            alert.addAction(okAction)
            self.present(alert,animated: true)
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
