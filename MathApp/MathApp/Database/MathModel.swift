//
//  MathModel.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 1/8/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import Foundation
import FMDB
var sharedInstance = MathModel()

class MathModel : NSObject
{
    var database : FMDatabase? = nil
    
    func getInstance() -> MathModel
    {
        if sharedInstance.database == nil
        {
            sharedInstance.database = FMDatabase(path: DatabaseModel.getPath("MathAnswers.db"))
        }
        return sharedInstance
    }
    
    func saveData(_ modelInfo : UserDetailsModel) -> Bool
    {
        sharedInstance.database?.open()
                let query = "INSERT INTO Data (rightAnswer, wrongAnswer, isCorrect, num1, num2, quizNumber) VALUES (?,?,?,?,?,?)"
        let isSave = sharedInstance.database?.executeUpdate(query, withArgumentsIn: [modelInfo.rightAnswer, modelInfo.wrongAnswers, modelInfo.isCorrect, modelInfo.num1, modelInfo.num2, modelInfo.quizNumber])
        return isSave!
    }
    
    func saveData2(rightAnswer : String, wrongAnswer : String, isCorrect : String, num1 : String, num2 : String, quizNumber : String)
    {
        sharedInstance.database?.open()
        let query = "INSERT INTO Data (rightAnswer, wrongAnswer, isCorrect, num1, num2, quizNumber) VALUES (?,?,?,?,?,?)"
        let isSave = sharedInstance.database?.executeUpdate(query, withArgumentsIn: [rightAnswer,wrongAnswer,isCorrect,num1,num2,quizNumber])
        print("Here is the data \(isSave)")
    }
    
    func getData(_ modelInfo : UserDetailsModel) -> [UserDetailsModel]
    {
        var getData = [UserDetailsModel]()
        let query = "SELECT * FROM Data"
        let data : FMResultSet? = database?.executeQuery(query, withArgumentsIn: [modelInfo.rightAnswer, modelInfo.wrongAnswers, modelInfo.isCorrect, modelInfo.num1, modelInfo.num2, modelInfo.quizNumber])
        if data != nil
        {
            while (data?.next())!
            {
                let mathData = UserDetailsModel.init(dict: data?.resultDictionary! as! NSDictionary)
                getData.append(mathData)
            }
        }
        return getData
        
    
    }
    
}
