//
//  DatabaseManager.swift
//  LocalDB
//
//  Created by Gabriel Espinosa on 12/20/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation
import FMDB
var sharedInstance = DatabaseManager()
var userModelInfo = UserDataModel()
var fmdb = FMDatabase()
class DatabaseManager : NSObject {
    var database : FMDatabase? = nil
    func getInstance() -> DatabaseManager {
        if sharedInstance.database == nil
        {
            sharedInstance.database = FMDatabase(path: DataBaseModel.getPath("DataForUser.db"))
        }
        return sharedInstance
    }
    func saveData(name: String, email: String, phoneNumber: String, country: String ) -> Bool {
        sharedInstance.database?.open()
        let isSave = sharedInstance.database?.executeUpdate("INSERT INTO User (name, email, phoneNumber, country) VALUES (?,?,?,?)", withArgumentsIn: [name, email, phoneNumber, country])
        sharedInstance.database?.close()
        return isSave!
    }
    func getDataFromUser() -> [UserDataModel]
    {
        sharedInstance.database?.open()
        var dataForUser = [UserDataModel]()
        let resultSet : FMResultSet? = sharedInstance.database?.executeQuery("SELECT * FROM User", withArgumentsIn: ["nil"])
        if resultSet == nil
        {
            print("Not able to get data from database!")
        }else
        {
            while((resultSet?.next())!)
            {
                let data = UserDataModel.init(dict: resultSet?.resultDictionary! as! NSDictionary )
                dataForUser.append(data)
            }
        }
        return dataForUser
    }
    func deleteUserData(id: Int) -> Bool
    {
        sharedInstance.database?.open()
        let strIns = "delete from User where Userid = ?"
        let result = sharedInstance.database?.executeUpdate(strIns, withArgumentsIn: [id])
        return result!
    }
    func updateLocalCount(userid : Int, name: String, email: String, phoneNumber : String, country : String) -> Bool {
        //let contactDB = FMDatabase(path: databasePath as String)
//        let path = FMDatabase(path: DataBaseModel.getPath("DataForUser.db"))
//
//            let query = "update User set name = '\(name)',email = '\(email)',phoneNumber = '\(phoneNumber)',country = '\(country)' where Userid = \(userid)"
//            let updatedEntry = sharedInstance.database?.executeUpdate(query, withArgumentsIn: [userid])
//
//            return updatedEntry!
        let query = "update User set name = '\(name)',email = '\(email)',phoneNumber = '\(phoneNumber)',country = '\(country)' where Userid = \(userid)"
        let updateEntry = sharedInstance.database?.executeUpdate(query, withArgumentsIn: [userid])
        return updateEntry!
    }
    
}
