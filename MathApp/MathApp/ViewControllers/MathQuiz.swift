//
//  ViewController.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 12/15/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class MathQuiz: UIViewController {
    @IBOutlet weak var btnAddictionQuiz: UIButton!
    @IBOutlet weak var btnSubtraction: UIButton!
    @IBOutlet weak var btnMultQuiz: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    
    var addInstance = AdditionQuizVC()
    var quizType : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.buttonStyle()
        
    }
    @IBAction func tapForAddQuiz(_ sender: UIButton) {
        quizType = "add"
        self.alertDifficultyOptions()
    }
    @IBAction func tapForSubtractionQuiz(_ sender: UIButton) {
        quizType = "sub"
        self.alertDifficultyOptions()
    }
    @IBAction func tapForMultiplication(_ sender: UIButton) {
        quizType = "mult"
        self.alertDifficultyOptions()
    }
    @IBAction func tapForDivisionQuiz(_ sender: UIButton) {
       quizType = "div"
       self.alertDifficultyOptions()
    }
    
    
    //**************************************************\\
    func buttonStyle()
    {
        btnAddictionQuiz.layer.borderWidth = addInstance.borderWdthValue
        btnAddictionQuiz.layer.cornerRadius = addInstance.cornerRadiusValue
        btnAddictionQuiz.layer.borderColor = UIColor.white.cgColor
        btnSubtraction.layer.borderWidth = addInstance.borderWdthValue
        btnSubtraction.layer.cornerRadius = addInstance.cornerRadiusValue
        btnSubtraction.layer.borderColor = UIColor.white.cgColor
        btnMultQuiz.layer.borderWidth = addInstance.borderWdthValue
        btnMultQuiz.layer.cornerRadius = addInstance.cornerRadiusValue
        btnMultQuiz.layer.borderColor = UIColor.white.cgColor
        btnDivision.layer.borderWidth = addInstance.borderWdthValue
        btnDivision.layer.cornerRadius = addInstance.cornerRadiusValue
        btnDivision.layer.borderColor = UIColor.white.cgColor
    }
    func alertDifficultyOptions()
    {
        // create the alert
        let alert = UIAlertController(title: "", message: "Please choose your difficulty", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Easy", style: UIAlertAction.Style.destructive, handler: { action in
            if self.quizType == "add"
            {
                self.navigateToAddVC(difficulty: "easy")
            }else if self.quizType == "sub"
            {
                self.navigateToSubVC(difficulty: "easy")
            }else if self.quizType == "mult"
            {
                self.navigateToMultVC(difficulty: "easy")
            }else {
                self.navigateToDivVC(difficulty: "easy")
            }
        }))
        alert.addAction(UIAlertAction(title: "Medium", style: UIAlertAction.Style.destructive, handler: { action in
            if self.quizType == "add"
            {
                self.navigateToAddVC(difficulty: "medium")
            }else if self.quizType == "sub"
            {
                self.navigateToSubVC(difficulty: "medium")
            }else if self.quizType == "mult"
            {
                self.navigateToMultVC(difficulty: "medium")
            }else {
                self.navigateToDivVC(difficulty: "medium")
            }
        }))
        alert.addAction(UIAlertAction(title: "Hard", style: UIAlertAction.Style.destructive, handler: { action in
            if self.quizType == "add"
            {
                self.navigateToAddVC(difficulty: "hard")
            }else if self.quizType == "sub"
            {
                self.navigateToSubVC(difficulty: "hard")
            }else if self.quizType == "mult"
            {
                self.navigateToMultVC(difficulty: "hard")
            }else {
                self.navigateToDivVC(difficulty: "hard")
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { action in

        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigateToAddVC(difficulty : String)
    {
        let objAddVC = storyboard?.instantiateViewController(withIdentifier: "AdditionQuizVC") as! AdditionQuizVC
        objAddVC.alertStr = difficulty
        self.navigationController?.pushViewController(objAddVC, animated: true)
        
    }
    func navigateToSubVC(difficulty : String)
    {
        let objSubVC = storyboard?.instantiateViewController(withIdentifier: "SubtractionVC") as! SubtractionVC
        objSubVC.alertStr = difficulty
        self.navigationController?.pushViewController(objSubVC, animated: true)
    }
    func navigateToMultVC(difficulty : String)
    {
        let objMultVC = storyboard?.instantiateViewController(withIdentifier: "MultiplicationQuizVC") as! MultiplicationQuizVC
        objMultVC.alertStr = difficulty
        self.navigationController?.pushViewController(objMultVC, animated: true)
    }
    func navigateToDivVC(difficulty : String)
    {
        let objDivVC = storyboard?.instantiateViewController(withIdentifier: "DivisionVC") as! DivisionVC
        objDivVC.alertStr = difficulty
        self.navigationController?.pushViewController(objDivVC, animated: true)
    }
}

