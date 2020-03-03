//
//  ViewController.swift
//  Int_Prac
//
//  Created by Gabriel Espinosa  on 3/2/20.
//  Copyright © 2020 Gabriel Espinosa . All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var btnAddition: UIButton!
    @IBOutlet weak var btnSubtraction: UIButton!
    @IBOutlet weak var btnMultiplication: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUILabel()
        configureUIButton()
    }

    @IBAction func tapForAddition(_ sender: UIButton) {
        let quizObj = storyboard?.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        quizObj.quizType = "addition"
        self.navigationController?.pushViewController(quizObj, animated: true)
    }
    @IBAction func tapForSubtraction(_ sender: UIButton) {
        let quizObj = storyboard?.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        quizObj.quizType = "subtraction"
        self.navigationController?.pushViewController(quizObj, animated: true)
    }
    @IBAction func tapForMultiplication(_ sender: UIButton) {
        let quizObj = storyboard?.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        quizObj.quizType = "multiplication"
        self.navigationController?.pushViewController(quizObj, animated: true)
    }
    @IBAction func tapForDivision(_ sender: UIButton) {
        let quizObj = storyboard?.instantiateViewController(withIdentifier: "QuizVC") as! QuizVC
        quizObj.quizType = "division"
        self.navigationController?.pushViewController(quizObj, animated: true)
    }
    
    
    func configureUILabel()
    {
        view.backgroundColor = .systemGray
        lblHome.text = "Welcome to Park Math"
        lblHome.font = lblHome.font.withSize(20)
        lblHome.textAlignment = .center
        lblHome.textColor = .black
    }
    func configureUIButton()
    {
        let btnRadius : CGFloat = 3
        
        btnAddition.setTitle("Addition", for: .normal)
        btnAddition.setTitleColor(.black, for: .normal)
        btnAddition.layer.backgroundColor = UIColor.white.cgColor
        btnAddition.layer.borderColor = UIColor.black.cgColor
        btnAddition.layer.borderWidth = btnRadius
        btnAddition.layer.cornerRadius = btnRadius
        
        btnSubtraction.setTitle("Subtraction", for: .normal)
        btnSubtraction.setTitleColor(.black, for: .normal)
        btnSubtraction.layer.backgroundColor = UIColor.white.cgColor
        btnSubtraction.layer.borderColor = UIColor.black.cgColor
        btnSubtraction.layer.borderWidth = btnRadius
        btnSubtraction.layer.cornerRadius = btnRadius
        
        btnMultiplication.setTitle("Multiplication", for: .normal)
        btnMultiplication.setTitleColor(.black, for: .normal)
        btnMultiplication.layer.backgroundColor = UIColor.white.cgColor
        btnMultiplication.layer.borderColor = UIColor.black.cgColor
        btnMultiplication.layer.borderWidth = btnRadius
        btnMultiplication.layer.cornerRadius = btnRadius
        
        btnDivision.setTitle("Division", for: .normal)
        btnDivision.setTitleColor(.black, for: .normal)
        btnDivision.layer.backgroundColor = UIColor.white.cgColor
        btnDivision.layer.borderColor = UIColor.black.cgColor
        btnDivision.layer.borderWidth = btnRadius
        btnDivision.layer.cornerRadius = btnRadius
    }
    
}

