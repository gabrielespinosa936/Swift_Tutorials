//
//  DatabaseModel.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 1/8/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit
import FMDB

class DatabaseModel: NSObject {
    // Insert
    // Get
    var database : FMDatabase? = nil
    var sharedInstance = DatabaseModel()
    class func getPath(_ fileName : String ) -> String
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileUrl = documentsDirectory.appendingPathComponent(fileName)
        print("Database path :- \(fileUrl.path)")
        return fileUrl.path
    }
  
    class func copyDatabase(_ filename : String)
    {
        let dbPath = getPath("MathAnswers.db")
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: dbPath)
        {
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(filename)
            var error : NSError?
            do {
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError {
                error = error1
            }
            if error == nil {
                print("error in database")
            }else {
                print("successs")
            }
        }
    }

}

