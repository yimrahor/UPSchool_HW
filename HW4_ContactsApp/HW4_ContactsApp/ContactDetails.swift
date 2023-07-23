//
//  ContactDetails.swift
//  HW4_ContactsApp
//
//  Created by imrahor on 23.07.2023.
//

import UIKit

class ContactDetails: UIViewController {
    
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var contactPersonNameLabel: UILabel!
    @IBOutlet weak var contactPersonTypeLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageName = ""
    var labelName = ""
    var cT: ContactType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDetail.image = UIImage(named: imageName)
        contactPersonNameLabel.text = labelName
        contactPersonTypeLabel.text = cT?.contactType
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
    }
}

extension ContactDetails: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ContactPeople.people.filter { $0.contactType == cT }.count - 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactDetailsViewCell", for: indexPath) as! ContactDetailsViewCell
        cell.cellLabel.text = ContactPeople.people.filter { $0.contactType == cT }.filter { $0.title != labelName }[indexPath.row].title
        cell.cellImageView.image = UIImage(named: ContactPeople.people.filter { $0.contactType == cT }.filter { $0.title != labelName }[indexPath.row].image)
        
        return cell
    }
    
    
}
