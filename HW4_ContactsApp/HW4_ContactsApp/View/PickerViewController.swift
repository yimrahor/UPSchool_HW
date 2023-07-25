//
//  PickerViewController.swift
//  HW4_ContactsApp
//
//  Created by imrahor on 22.07.2023.
//

import UIKit


protocol PickerViewControllerDelegate{
    func didSelectContactType(_ type: ContactType)
}



class PickerViewController: UIViewController {

    @IBOutlet weak var filterPickerView: UIPickerView!
    @IBOutlet weak var labelPickerView: UILabel!
    private var selectedContactType: ContactType?
    
    var pickerViewDelegate: PickerViewControllerDelegate?
    
    var pickerlabelText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterPickerView.delegate = self
        filterPickerView.dataSource = self
        labelPickerView.text = pickerlabelText
    }
    
    
    
    @IBAction func doneButtonAct(_ sender: Any) {
        pickerViewDelegate?.didSelectContactType(selectedContactType ?? .allContacts)
        dismiss(animated: true)
    }
    
    
    
    @IBAction func cancelButtonAct(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ContactType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ContactType.allCases[row].contactType
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedContactType = ContactType.allCases[row]
        labelPickerView.text = selectedContactType?.contactType
        
    }
    
    
    
    
    
}
