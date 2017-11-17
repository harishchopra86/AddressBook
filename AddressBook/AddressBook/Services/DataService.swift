//
//  DataService.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataService {
    static let sharedInstance = DataService()
    
    func parseContacts(response:JSON)-> [Contact] {
        var contactsArray = [Contact]()
        for item in response["results"].arrayValue {
            let objContact = Contact(withJSON: item)
            contactsArray.append(objContact)
        }
        return contactsArray
    }
    
    func getContactsArray(onSuccess: @escaping([Contact]) -> Void, onFailure: @escaping(Error) -> Void) {
        APIManager.sharedInstance.getContacts(onSuccess: { (response) in
            let contactsArray = self.parseContacts(response: response)
            onSuccess(contactsArray)
        }) { (error) in
            onFailure(error)
        }
    }
}
