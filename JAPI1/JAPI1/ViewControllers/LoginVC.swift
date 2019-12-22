//
//  ViewController.swift
//  JAPI1
//
//  Created by Gabriel Espinosa on 12/1/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapToLogin(_ sender: UIButton) {
        if txtEmail.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter a valid email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if txtPassword.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter a valid email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
//            let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//            self.navigationController?.pushViewController(objHomeVC, animated: true)
            self.getApiForLogin()
        }
    }
    @IBAction func tapToRegister(_ sender: UIButton) {
        let objRegister = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        self.navigationController?.pushViewController(objRegister, animated: true)
    }
    func goHome()
    {
        let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(objHomeVC, animated: true)
    }
    func getApiForLogin()
    {
        let urlString = "http://3.17.208.36/appointment/index.php/api/login"
        let param = ["email":self.txtEmail.text!, "password": self.txtPassword.text!, "fcmToken": "fghjkhgytf", "deviceID": "uhijkoijuhi",
                     "deviceType": 1] as [String:Any]
        
        Alamofire.request(urlString, method: .post, parameters: param,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                if let userData = response.result.value as? NSDictionary
                {
                    let status = userData["success"] as! Int
                    DispatchQueue.main.async(execute: {
                        if status == 0
                        {
                            let alert = UIAlertController(title: "Alert", message: "Unsuccessful login", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }else {
                            let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                            self.navigationController?.pushViewController(objHomeVC, animated: true)
                        }
                    })
                }
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }
    
    func doesNothing()
    {
        /*
         URL - http://3.17.208.36/appointment/index.php/api/login
         
         Parameters : -  email , password
         
         
         Url : http://3.17.208.36/appointment/index.php/api/register
         
         Parameters:
         email
         password
         name
         phone
         
         country
         */
    }

}

