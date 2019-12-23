//
//  UserDataModel.swift
//  LocalDB
//
//  Created by Gabriel Espinosa on 12/20/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class UserDataModel: NSObject {
    
//    struct SignUpModel {
//        let name : String
//        let email : String
//        let phoneNumber : String
//        let country : String
//    }
    var id : String = ""
    var name : String = ""
    var email : String = ""
    var phoneNumber : String = ""
    var country : String = ""
    
    override init(){}
    
    init(dict: NSDictionary)
    {
        self.id = dict.getString(key: "Userid")
        self.name = dict.getString(key: "name")
        self.email = dict.getString(key: "email")
        self.phoneNumber = dict.getString(key: "phoneNumber")
        self.country = dict.getString(key: "country")
    }

}

extension NSDictionary {
    func getString(key: String) -> String {
        if let value = self[key]
        {
            let string = NSString.init(format: "%@", value as! CVarArg) as String
            if(string.lowercased() == "nil" || string.lowercased() == "null")
            {
                return ""
            }
            return string.trimmingCharacters(in: .whitespaces)
        }
        return ""
    }
}
