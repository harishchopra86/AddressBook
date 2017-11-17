//
//  ContactCell.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var phoneLbl:UILabel!

    func updtateCellUI(contact:Contact) {
        let fullName = "\(contact.title) \(contact.firstName) \(contact.lastName)"
        nameLbl.text = fullName
        phoneLbl.text = contact.phone
        
    }
}
