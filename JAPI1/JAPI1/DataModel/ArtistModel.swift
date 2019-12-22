//
//  ArtistModel.swift
//  JAPI1
//
//  Created by Gabriel Espinosa on 12/12/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class ArtistModel: NSObject {
    
    var typeID : String = ""
    var typeImg : String = ""
    var typeName : String = ""
    
    struct keyPlacesData {
        static let typeID = "typeID"
        static let typeImg = "typeImg"
        static let typeName = "typeName"
    }
    
    override init() {
        
    }
    init(dict: NSDictionary){
        self.typeID = dict.getString(key: keyPlacesData.typeID)
        self.typeImg = dict.getString(key: keyPlacesData.typeImg)
        self.typeName = dict.getString(key: keyPlacesData.typeName)
    }
}

extension NSDictionary {
    func getString(key: String) -> String {
        let emptyString = ""
        if let value = self[key] {
            let string = NSString.init(format: "%@", value as! CVarArg) as String
            if string.lowercased() == "null" || string.lowercased() == "nil"
            {
                return emptyString
            }
            return string.trimmingCharacters(in: .whitespaces)
        }
        return emptyString
    }
    
   
}
