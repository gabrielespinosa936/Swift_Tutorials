//
//  ViewController.swift
//  LocalDB
//
//  Created by Gabriel Espinosa on 12/18/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import FMDB
class CellForUserData : UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
}

class HomeVC: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    @IBOutlet weak var mainCellListing: UITableView!
    
    var arrayData = [UserDataModel]()
    var dbm = DatabaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
        self.mainCellListing.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.arrayData = dbm.getInstance().getData()
        self.mainCellListing.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellForUserData") as! CellForUserData
        cell.lblName.text = self.arrayData[indexPath.row].name
        cell.lblCountry.text = self.arrayData[indexPath.row].country
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    @IBAction func tapToAddData(_ sender: UIButton) {
        let objAddUserData = self.storyboard?.instantiateViewController(withIdentifier: "AddUserData") as! AddUserData
        self.navigationController?.pushViewController(objAddUserData, animated: true)
        
    }
    
}

