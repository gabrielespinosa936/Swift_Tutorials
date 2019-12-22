//
//  RegisterVC.swift
//  JAPI1
//
//  Created by Gabriel Espinosa on 12/1/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import Alamofire

class RegisterVC: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func tapToRegister(_ sender: UIButton) {
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
            let alert = UIAlertController(title: "Alert!", message: "Please enter your phone number", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if txtPassword.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please enter your password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else {
//            let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//            self.navigationController?.pushViewController(objHomeVC, animated: true)
            self.apiToRegister()
        }
    }
    
    @IBAction func tapToGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func goHome()
    {
        let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(objHomeVC, animated: true)
    }
    func apiToRegister()
    {
        let urlString = "http://3.17.208.36/appointment/index.php/api/register"
        
        let dictParam = ["name":self.txtName.text!, "email":self.txtEmail.text!, "password": self.txtPassword.text!,  "username": "fghjkhgytf","gender":"male", "country": "USA", "city":"la", "latlong":"23.555.72.12122", "phone":self.txtPhoneNumber.text!, "address":"USA", "artistType":"10", "availableSlot":"11am-12am", "other":"", "fcmToken":"ghjkgvhghj", "deviceID": "uhijkoijuhi", "deviceType": 1] as [String:Any]
        
        Alamofire.request(urlString, method: .post, parameters: dictParam,encoding: JSONEncoding.default, headers: ["Content-Type":"application/json"]).responseJSON {
            response in
            switch response.result {
            case .success:
                print(response)
                if let userData = response.result.value as? NSDictionary
                {
                    let status = userData["success"] as! Int
                    let errorMessage = userData["message"] as! String
                    DispatchQueue.main.async(execute: {
                        if status == 0
                        {
                            let alert = UIAlertController(title: "Alert", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            
                        }else {
                            let objectHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                            self.navigationController?.pushViewController(objectHomeVC, animated: true)
                        }
                    })
                }
                
                break
            case .failure(let error):
                
                print(error)
            }
        }
    }

}
