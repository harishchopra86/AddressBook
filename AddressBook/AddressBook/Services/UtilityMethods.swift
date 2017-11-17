//
//  UtilityMethods.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import Foundation

class UtilityMethods {
   class func downloadImageFromUrl(url: URL, completion: @escaping(Data)-> ()){
        APIManager.sharedInstance.getDataFromUrl(url: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            completion(data)
        }
    }
}
