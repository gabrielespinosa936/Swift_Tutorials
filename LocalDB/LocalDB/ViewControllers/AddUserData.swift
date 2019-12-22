//
//  AddUserData.swift
//  LocalDB
//
//  Created by Gabriel Espinosa on 12/18/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class AddUserData: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    var dataBaseManager = DatabaseManager()
    var userDataModel = UserDataModel()
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tapToEnterData(_ sender: UIButton) {
        if txtName.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter your name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if txtEmail.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter your email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if txtPhoneNumber.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter your Phone Number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if txtCountry.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter your country", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
            
            self.addUserDataToDB()
        }
        
    }
    func addUserDataToDB()
    {
        //let modelInfo = UserDataModel.SignUpModel(name: self.txtName.text!, email: self.txtEmail.text!, phoneNumber: self.txtPhoneNumber.text!, country: self.txtCountry.text!) 
        let isSave = dataBaseManager.getInstance().saveData(name: self.txtName.text!, email: self.txtEmail.text!, phoneNumber: self.txtPhoneNumber.text!, country: self.txtCountry.text!)
        print(isSave)
    }
    
    //MARK: - TextfieldDelegates.....
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false
    }
    
    
    



}
