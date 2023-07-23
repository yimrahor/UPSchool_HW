//
//  ViewController.swift
//  HW4_ContactsApp
//
//  Created by imrahor on 22.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contactsTableView: UITableView!
    
    private var selectedContactType: ContactType? {
        didSet{
            contactsTableView.reloadData()
        }
    }
    
    //var headers: [String] = ["Family", "Friends", "Work", "School"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        
        let filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease.circle"), style: .done, target: self, action: #selector(filterButtonTapped))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc private func filterButtonTapped() {
        let storyboard = UIStoryboard(name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "PickerViewController") as? PickerViewController {
            vc.pickerViewDelegate = self
            vc.modalPresentationStyle = .overCurrentContext
            if let a = selectedContactType {
                vc.pickerlabelText = a.contactType
            } else {
                vc.pickerlabelText = ContactType.allContacts.contactType
            }
            
            self.present(vc, animated: true)
        }
    }
    
}


extension ViewController: PickerViewControllerDelegate{
    func didSelectContactType(_ type: ContactType) {
        selectedContactType = type
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSection().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //return headers[section]
        return setSection()[section].contactType
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterPeople(section).count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell", for: indexPath) as! ContactTableViewCell
        //cell.cellLabel.text = ContactPeople.people[indexPath.row].title
        //cell.cellImageView.image = UIImage(named: ContactPeople.people[indexPath.row].image)
        
        cell.cellLabel.text = filterPeople(indexPath.section)[indexPath.row].title
        cell.cellImageView.image = UIImage(named: filterPeople(indexPath.section)[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = ContactDetails.instantiateFromStoryboard(String(describing: ContactDetails.self))
        
        vc.imageName = filterPeople(indexPath.section)[indexPath.row].image
        vc.labelName = filterPeople(indexPath.section)[indexPath.row].title
        vc.cT = filterPeople(indexPath.section)[indexPath.row].contactType
        
        self.navigationController?.show(vc, sender: nil)
    }
    
    
    private func setSection() -> [ContactType] {
         if selectedContactType == nil {
             return ContactType.allCases
        } else if selectedContactType == .allContacts {
            return ContactType.allCases
        } else {
            return [selectedContactType!]
        }
        
        /* if let selectedContactType {
            if selectedContactType == .allContacts {
                return ContactType.allCases
            }
            return [selectedContactType]
        }
        return ContactType.allCases */
        
    }
    
    
    private func filterPeople(_ sectionIndex:Int) -> [Contacts]{
        
        /*if let choosenSection = selectedContactType {
            return ContactPeople.people.filter { $0.contactType == choosenSection }
        } else if selectedContactType == .allContacts {
            return ContactPeople.people.filter { $0.contactType == ContactType.allCases[sectionIndex] }
        }
        return ContactPeople.people.filter { $0.contactType == ContactType.allCases[sectionIndex] } */
        
        if selectedContactType == nil || selectedContactType == .allContacts {
            return ContactPeople.people.filter { $0.contactType == ContactType.allCases[sectionIndex] }
        } else {
            return ContactPeople.people.filter { $0.contactType == selectedContactType}
        }
        
    }
    
}


extension UIViewController {
    static func instantiateFromStoryboard(_ name: String = "Main") -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    private static func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}
