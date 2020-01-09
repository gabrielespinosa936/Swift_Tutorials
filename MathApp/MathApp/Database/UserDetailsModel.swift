 //
//  UserDetailsModel.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 1/8/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit

class UserDetailsModel: NSObject {
    var dataId : String = ""
    var wrongAnswers : String = ""
    var rightAnswer : String = ""
    var isCorrect : String = ""
    var num1 : String = ""
    var num2 : String = ""
    var quizNumber : String = ""
    override init()
    {
        
    }
    init(dict : NSDictionary)
    {
        self.dataId = dict.getString(key: "Dataid")
        self.wrongAnswers = dict.getString(key: "wrongAnswer")
        self.rightAnswer = dict.getString(key: "rightAnswer")
        self.isCorrect = dict.getString(key: "isCorrect")
        self.num1 = dict.getString(key: "num1")
        self.num2 = dict.getString(key: "num2")
        self.quizNumber = dict.getString(key: "quizNumber")
    }
}
 
 extension NSDictionary {
    func getString(key : String) -> String
    {
        if let value = self[key]
        {
            let string = NSString.init(format: "%@", value as! CVarArg) as String
            if(string.lowercased() == "null" || string.lowercased() == "nil")
            {
                return ""
            }
            return string.lowercased()
        }
        return ""
    }
 }
