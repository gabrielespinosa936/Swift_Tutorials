//
//  DataBaseModel.swift
//  LocalDB
//
//  Created by Gabriel Espinosa on 12/19/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import FMDB

class DataBaseModel: NSObject {
    
    var sharedInstance = DataBaseModel()
    var database : FMDatabase? = nil
    var userModelInfo = UserDataModel()
    
    // Getting the database path
    class func getPath(_ fileName: String) -> String {
        let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = docDir.appendingPathComponent(fileName)
        print("Database Path :- \(fileUrl.path)")
        return fileUrl.path
    }
    class func copyDatabase(_ fileName : String){
        let dbPath = getPath("DataForUser.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath)
        {
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(fileName)
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            if error == nil {
                print("error in db")
            }else {
                print("Successful DB access")
            }
        }
    }


    
    
    
}
