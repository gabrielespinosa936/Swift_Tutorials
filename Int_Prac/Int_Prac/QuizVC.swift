//
//  QuizVC.swift
//  Int_Prac
//
//  Created by Gabriel Espinosa  on 3/2/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    
    @IBOutlet weak var lblQuiz: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var txtQuestion: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var txtAnswer: UITextField!
    
    var quizType : String = ""
    var btnRadius : CGFloat = 3
    var txtRadius : CGFloat = 3
    var firstRandomInt = Int.random(in: 0...12)
    var secondRandomInt = Int.random(in: 0...12)
    var timer : Timer?
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUILabel()
        configureUIButton()
        configureUITextfield()
    }
    @IBAction func tapToSubmitAnswer(_ sender: UIButton) {
        if txtAnswer.text != "\(correctAnswer)"  {
            correctAnswer = firstRandomInt + secondRandomInt
            if txtAnswer.text == "\(correctAnswer)"
            {
                lblSymbol.text = "😔"
                score = score + 5
            }else {
                lblSymbol.text = "😁"
            }
        }
    }
}

extension QuizVC
{
    func displayAdditionQuestion()
    {
        lblQuiz.text = "Addition"
        txtQuestion.text = "\(firstRandomInt) + \(secondRandomInt) "
        
    }
    func displaySubtractionQuestion()
    {
        lblQuiz.text = "Subtraction"
        txtQuestion.text = "\(firstRandomInt) - \(secondRandomInt)"
        correctAnswer = firstRandomInt - secondRandomInt
        if txtAnswer.text == "\(correctAnswer)"
        {
            lblSymbol.text = "😔"
            score = score + 5
        }else {
            lblSymbol.text = "😁"
        }
    }
    func displayMultiplicationQuestion()
    {
        lblQuiz.text = "Multiplication"
        txtQuestion.text = "\(firstRandomInt) * \(secondRandomInt)"
        correctAnswer = firstRandomInt * secondRandomInt
        if txtAnswer.text == "\(correctAnswer)"
        {
            lblSymbol.text = "😔"
            score = score + 5
        }else {
            lblSymbol.text = "😁"
        }
    }
    func displayDivisionQuestion()
    {
        lblQuiz.text = "Division"
        txtQuestion.text = "\(firstRandomInt) / \(secondRandomInt)"
        if secondRandomInt <= 0 {
            secondRandomInt = secondRandomInt + 1
        }
        correctAnswer = firstRandomInt / secondRandomInt
        if txtAnswer.text == "\(correctAnswer)"
        {
            lblSymbol.text = "😔"
            score = score + 5
        }else {
            lblSymbol.text = "😁"
        }
    }
    func configureUILabel()
    {
        view.backgroundColor = .systemGray
        
        lblQuiz.textAlignment = .center
        lblQuiz.textColor = .black
        
        if quizType == "addition" {
            displayAdditionQuestion()
        }else if quizType == "subtraction"
        {
            displaySubtractionQuestion()
        }else if quizType == "multiplication"
        {
            displayMultiplicationQuestion()
        }else if quizType == "division"
        {
            displayDivisionQuestion()
        }else {
            lblQuiz.text = "Whoops!"
        }

        
    }
    func configureUIButton()
    {
        btnSubmit.setTitle("Submit", for: .normal)
        btnSubmit.setTitleColor(.black, for: .normal)
        btnSubmit.layer.backgroundColor = UIColor.white.cgColor
        btnSubmit.layer.borderColor = UIColor.black.cgColor
        btnSubmit.layer.borderWidth = btnRadius
        btnSubmit.layer.cornerRadius = btnRadius
    }
    func configureUITextfield()
    {
        txtQuestion.textAlignment = .center
        txtQuestion.layer.backgroundColor = UIColor.white.cgColor
        txtQuestion.textColor = .black
        txtQuestion.layer.borderWidth = txtRadius
        txtQuestion.layer.borderColor = UIColor.black.cgColor
        txtQuestion.layer.cornerRadius = txtRadius
        
        txtAnswer.textAlignment = .center
        txtAnswer.layer.backgroundColor = UIColor.white.cgColor
        txtAnswer.textColor = .black
        txtAnswer.layer.borderWidth = txtRadius
        txtAnswer.layer.borderColor = UIColor.black.cgColor
        txtAnswer.layer.cornerRadius = txtRadius
    }

}
