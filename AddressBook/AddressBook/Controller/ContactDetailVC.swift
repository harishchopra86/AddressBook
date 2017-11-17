//
//  ContactDetailVC.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class ContactDetailVC: UIViewController {

    var contact:Contact!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dateOfBirthLbl: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact detail"
        updateUI()
    }
    
    func initialiseContact(contactObject:Contact) {
        contact = contactObject
    }
    
    func updateUI() {
        nameLbl.text = "Name: \(contact.title) \(contact.firstName) \(contact.lastName)"
        phoneLbl.text = "Phone: \(contact.phone)"
        genderLbl.text = "Gender: \(contact.gender)"
        emailLbl.text = "Email: \(contact.email)"
        addressLbl.text = "Address: \(contact.street)"
        dateOfBirthLbl.text = "DOB: \(contact.dateOfBirth)"
        
        if let imageUrl = URL(string: contact.pictureUrl) {
            UtilityMethods.downloadImageFromUrl(url: imageUrl, completion: { (data) in
                DispatchQueue.main.async() {
                    self.contactImageView.image = UIImage(data: data)
                }
            })
        }
    }
}
