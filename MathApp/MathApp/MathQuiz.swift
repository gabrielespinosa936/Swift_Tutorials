//
//  ViewController.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 12/15/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class MathQuiz: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tapForAddQuiz(_ sender: UIButton) {
        let objAddVC = storyboard?.instantiateViewController(withIdentifier: "AdditionQuizVC") as! AdditionQuizVC
        self.navigationController?.pushViewController(objAddVC, animated: true)
    }
    @IBAction func tapForMultiplication(_ sender: UIButton) {
        let objMultiplicationVC = storyboard?.instantiateViewController(withIdentifier: "MultiplicationQuizVC") as! MultiplicationQuizVC
        self.navigationController?.pushViewController(objMultiplicationVC,animated: true)
        
    }
    

}

