//
//  APIManager.swift
//  AddressBook
//
//  Created by Harish Chopra on 2017-11-16.
//  Copyright © 2017 Harish Chopra. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIManager: NSObject {
    
    let baseUrl = "https://randomuser.me/api"
    static let sharedInstance = APIManager()
    static let getContactsEndpoint = "?results=50"
    
    func getContacts(onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseUrl + APIManager.getContactsEndpoint
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
             let result = try? JSON(data: data!)
                onSuccess(result!)
            }
        })
        task.resume()
    }
    
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

}
