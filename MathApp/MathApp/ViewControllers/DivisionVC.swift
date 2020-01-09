//
//  DivisionVC.swift
//  MathApp
//
//  Created by Gabriel Espinosa on 1/5/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit
import AVKit
import Cheers
class DivisionVC: UIViewController {
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCorrectAnswer: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblFirstInteger: UILabel!
    @IBOutlet weak var lblSecondInteger: UILabel!
    @IBOutlet weak var lblMathSymbol: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    
    // Variables
    var increaseDecrease : Int = 5
    var firstRandomInt = 0
    var secondRandomInt = 0
    var score = 0
    var player: AVAudioPlayer?
    var timer = Timer()
    var counter = 0
    var flag : Bool = false
    var success : String = "Good Job!"
    var failure : String = "Wrong!"
    var alertStr : String = ""
    let cheerView = CheerView()
    var borderWdthValue : CGFloat = 3
    var cornerRadiusValue : CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.playMusic()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        self.checkDifficulty()
    }
    @IBAction func tapToGoHome(_ sender: UIButton) {
        player?.stop()
        let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "MathQuiz") as! MathQuiz
        self.navigationController?.pushViewController(objHomeVC, animated: true)
    }
    @IBAction func tapToSubmitAnswer(_ sender: UIButton) {
        cheerView.stop()
        
        if flag
        {
            score = 0
            self.resetValues()
            self.highScoreAnimation()
            self.playMusic()
        }else {
            
            self.start()
        }
    }
    //Timer Action Method...
    @objc func timerAction()
    {
        counter += 1
        lblTime.text = "\(counter)"
        if counter > 10
        {
            lblTime.textColor = UIColor.orange
        }else if counter > 15
        {
            lblTime.textColor = UIColor.red
        }else
        {
            lblTime.textColor = UIColor.white
        }
        
        if counter > 30
        {
            self.callFunctions()
        }
    }
    //Initialise cheer view third party
    func cheer()
    {
        cheerView.frame = CGRect.init(x: self.view.frame.width/2, y: -100, width: 0, height: 0)
        view.addSubview(cheerView)
        
        // Configure
        cheerView.config.particle = .confetti(allowedShapes: [Particle.ConfettiShape.curvedQuadrilateral])
        // Start
        cheerView.start()
    }
    
    //Submit and check sum correct or incorrect
    func start()
    {
        let correctAnswer = firstRandomInt / secondRandomInt
        if txtAnswer.text == "\(correctAnswer)"
        {
            self.correctAnswerAction()
        }else
        {
            self.incorrectAnswerAction()
        }
        self.checkDifficulty()
    }
    //This funcation generate random number for sum..
    func generateEasyMathProblem()
    {
        firstRandomInt = Int.random(in: 0..<12)
        secondRandomInt = Int.random(in: 0..<12)
        lblFirstInteger.text = "\(firstRandomInt)"
        lblSecondInteger.text = "\(secondRandomInt)"
        txtAnswer.text = ""
    }
    func generateMediumMathProblem()
    {
        firstRandomInt = Int.random(in: 13..<18)
        secondRandomInt = Int.random(in: 13..<18)
        lblFirstInteger.text = "\(firstRandomInt)"
        lblSecondInteger.text = "\(secondRandomInt)"
        txtAnswer.text = ""
    }
    func generateHardMathProblem()
    {
        firstRandomInt = Int.random(in: 0..<24)
        secondRandomInt = Int.random(in: 0..<24)
        lblFirstInteger.text = "\(firstRandomInt)"
        lblSecondInteger.text = "\(secondRandomInt)"
        txtAnswer.text = ""
    }
    
    // This funcation using for play background music
    func playMusic() {
        
        let url = Bundle.main.url(forResource: "QuizMusic", withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
            //player.stop()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    //This function call when game over and set all values
    func callFunctions()
    {
        self.gameOverScreen()
        lblScore.text = "Your score is \(score)"
        lblScore.isHidden = false
        self.highScoreAnimation()
    }
    func checkDifficulty()
    {
        if alertStr == "easy"
        {
            print("easy")
            self.generateEasyMathProblem()
        }else if alertStr == "medium"
        {
            print("medium")
            self.generateMediumMathProblem()
        }else if alertStr == "hard"
        {
            print("hard")
            self.generateHardMathProblem()
        }else {
            print("Cancel")
        }
    }
    
    
    //High Score animation cheer method..
    func highScoreAnimation()
    {
        if score > 29
        {
            self.cheer()
        }
    }
    
    
    //This funcation would call when Game over and reset all values
    func resetValues()
    {
        flag = false
        score = 0
        counter = 0
        timer.invalidate()
        lblScore.text = ""
        txtAnswer.text = ""
        lblTime.text = ""
        lblTime.isHidden = false
        txtAnswer.isHidden = false
        lblFirstInteger.isHidden = false
        lblSecondInteger.isHidden = false
        lblMathSymbol.isHidden = false
        lblCorrectAnswer.isHidden = true
        btnSubmit.setTitle("Submit", for: .normal)
        btnSubmit.layer.borderWidth = borderWdthValue
        btnSubmit.layer.cornerRadius = cornerRadiusValue
        btnSubmit.layer.borderColor = UIColor.white.cgColor
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        self.checkDifficulty()
        //self.generateMathProblem()
    }
    
    //This funcation would call when Game Over
    func gameOverScreen()
    {
        cheerView.stop()
        lblScore.text = "Your score is \(score)"
        lblTime.isHidden = true
        txtAnswer.isHidden = true
        lblFirstInteger.isHidden = true
        lblSecondInteger.isHidden = true
        lblMathSymbol.isHidden = true
        lblCorrectAnswer.isHidden = true
        btnSubmit.setTitle("Retry", for: .normal)
        flag = true
        
    }
    
    //This funcation would call when correct answer in field
    func correctAnswerAction()
    {
        score = score + 5
        lblCorrectAnswer.textColor = UIColor.green
        lblCorrectAnswer.text = success
        lblCorrectAnswer.isHidden = false
        lblScore.isHidden = false
        lblScore.text = "Your total score : \(score)"
    }
    
    //This funcation would call when incorrect answer in field
    func incorrectAnswerAction()
    {
        lblCorrectAnswer.isHidden = false
        lblScore.isHidden = false
        score = score - 5
        lblCorrectAnswer.textColor = UIColor.red
        lblCorrectAnswer.text = failure
        lblScore.text = "Your total score : \(score)"
        lblCorrectAnswer.shake()
    }
}

    
    


