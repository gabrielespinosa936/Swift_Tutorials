//
//  DisplaySolutionsVC.swift
//  MathApp
//
//  Created by Gabriel Espinosa  on 1/8/20.
//  Copyright © 2020 Gabriel. All rights reserved.
//

import UIKit
import FMDB



class MainListing : UITableViewCell
{
    @IBOutlet weak var lblWrong: UILabel!
    @IBOutlet weak var lblRight: UILabel!
}



@available(iOS 13.0, *)
class DisplaySolutionsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var solutionListing: UITableView!
    
    var userInfo = [UserDetailsModel]()
    var mathModel = MathModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userInfo = mathModel.getInstance().getData()
        self.solutionListing.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainListing") as! MainListing
        cell.lblWrong.text = userInfo[indexPath.row].wrongAnswers
        cell.lblRight.text = userInfo[indexPath.row].rightAnswer
        return cell
    }
    @IBAction func tapToGoHome(_ sender: UIButton) {
        let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "MathQuiz") as! MathQuiz
        self.navigationController?.pushViewController(objHomeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
