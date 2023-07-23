//
//  Contacts.swift
//  HW4_ContactsApp
//
//  Created by imrahor on 22.07.2023.
//

import Foundation

enum ContactType: CaseIterable {
    case allContacts
    case family
    case friends
    case work
    case school
    
    var contactType: String {
        switch self {
        case .allContacts:
            return "All Contacts"
        case .family:
            return "Family"
        case .friends:
            return "Friends"
        case .work:
            return "Work"
        case .school:
            return "School"
        }
    }
}

enum Images: String {
    case female = "female"
    case male = "male"
}

class Contacts {
    var title: String
    var image: String
    var contactType: ContactType
    
    init(title: String, image: String, contactType: ContactType) {
        self.title = title
        self.image = image
        self.contactType = contactType
    }
}

class ContactPeople {
    static let people: [Contacts] = [
        Contacts(title: "Emirhan", image: Images.male.rawValue, contactType: .family),
        Contacts(title: "Zeynep", image: Images.female.rawValue, contactType: .family),
        Contacts(title: "Oğuz", image: Images.male.rawValue, contactType: .family),
        Contacts(title: "Selaha", image: Images.female.rawValue, contactType: .family),
        Contacts(title: "Zehra", image: Images.female.rawValue, contactType: .family),
        Contacts(title: "Mehmet", image: Images.male.rawValue, contactType: .family),
        Contacts(title: "Kübra", image: Images.female.rawValue, contactType: .friends),
        Contacts(title: "Mustafa", image: Images.male.rawValue, contactType: .friends),
        Contacts(title: "Hazal", image: Images.female.rawValue, contactType: .friends),
        Contacts(title: "Ezgi", image: Images.female.rawValue, contactType: .friends),
        Contacts(title: "Yücel", image: Images.male.rawValue, contactType: .work),
        Contacts(title: "Ebru", image: Images.female.rawValue, contactType: .work),
        Contacts(title: "Gökhan", image: Images.male.rawValue, contactType: .work),
        Contacts(title: "Nergis", image: Images.female.rawValue, contactType: .school),
        Contacts(title: "Ahmet", image: Images.male.rawValue, contactType: .school)
    ]
}


