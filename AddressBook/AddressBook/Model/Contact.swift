//
//  Contact.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Contact {
    var gender:String
    var title:String
    var firstName:String
    var lastName:String
    var street:String
    var city:String
    var state:String
    var postcode:String
    var email:String
    var username:String
    var password:String
    var dateOfBirth:String
    var pictureUrl:String
    var phone:String

    init(withJSON contactJSON:JSON) {
        let objDictionary = contactJSON.dictionaryValue
        
        gender = (objDictionary["gender"]?.stringValue)!
        title = (objDictionary["name"]!["title"].stringValue)
        firstName = (objDictionary["name"]!["first"].stringValue)
        lastName = (objDictionary["name"]!["last"].stringValue)
        street = (objDictionary["location"]!["street"].stringValue)
        city = (objDictionary["location"]!["city"].stringValue)
        state = (objDictionary["location"]!["state"].stringValue)
        postcode = (objDictionary["location"]!["postcode"].stringValue)
        email = (objDictionary["email"]?.stringValue)!
        dateOfBirth = (objDictionary["dob"]?.stringValue)!
        pictureUrl = (objDictionary["picture"]!["large"].stringValue)
        username = (objDictionary["login"]!["username"].stringValue)
        password = (objDictionary["login"]!["password"].stringValue)
        phone = (objDictionary["phone"]?.stringValue)!
    }
    
}
