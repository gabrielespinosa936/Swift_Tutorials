//
//  MultiplicationQuizVC.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 12/18/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit

class MultiplicationQuizVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapToGoBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
