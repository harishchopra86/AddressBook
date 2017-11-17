//
//  ViewController.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import UIKit

class ContactList: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var contactsArray = [Contact]()

    @IBOutlet weak var contactsTableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contacts"
        downloadData()
    }
    
    func downloadData() {
        DataService.sharedInstance.getContactsArray(onSuccess: { (contactsArray) in
            self.contactsArray = contactsArray
            DispatchQueue.main.async {
                self.contactsTableView.reloadData()
            }
        }) { (error) in
            let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.show(alert, sender: nil)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as? ContactCell
        {
            let contact = contactsArray[indexPath.row]
            cell.updtateCellUI(contact: contact)
            return cell
        }
        return ContactCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contactsArray[indexPath.row]
        performSegue(withIdentifier: "ContactDetailVC", sender: contact)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let contactDetailVC = segue.destination as? ContactDetailVC {
            contactDetailVC.initialiseContact(contactObject: sender as! Contact)            
        }
    }
}

