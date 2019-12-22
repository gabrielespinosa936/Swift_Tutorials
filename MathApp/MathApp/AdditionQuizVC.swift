//
//  AdditionQuizVC.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 12/18/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class AdditionQuizVC: UIViewController {
    @IBOutlet weak var lblFirstInteger: UILabel!
    @IBOutlet weak var lblSecondInteger: UILabel!
    @IBOutlet weak var lblMathSymbol: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    var firstRandomInt = Int.random(in: 0..<12)
    var secondRandomInt = Int.random(in: 0..<12)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapToGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func tapToSubmitAnswer(_ sender: UIButton) {
        if txtAnswer.text?.trimmingCharacters(in: .whitespaces) == ""
        {
            let alert = UIAlertController(title: "Alert!", message: "Please submit your answer", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func generateMathProblem()
    {
        lblFirstInteger.text = "\(firstRandomInt)"
        lblSecondInteger.text = "\(secondRandomInt)"
        var correctAnswer = firstRandomInt + secondRandomInt
        if txtAnswer.text?.trimmingCharacters(in: .whitespaces) as? Int != correctAnswer
        {
            
        }
    }
    
}
