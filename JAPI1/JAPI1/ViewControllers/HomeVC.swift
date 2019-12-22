//
//  HomeVC.swift
//  JAPI1
//
//  Created by Gabriel Espinosa on 12/1/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import Alamofire
class cellForListing : UITableViewCell {
    @IBOutlet weak var lblForID: UILabel!
    @IBOutlet weak var lblForName: UILabel!
    @IBOutlet weak var imgForArtist: UIImageView!
    
}

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mainListing: UITableView!
    @IBOutlet weak var btnCollectionList: UIButton!
    
    var arrayArtistData = [ArtistModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mainListing.tableFooterView = UIView()
        self.mainListing.estimatedRowHeight = 100
        mainListing.separatorColor = UIColor.white
        self.apiCallForList()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArtistData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForListing") as! cellForListing
        cell.lblForID.text = self.arrayArtistData[indexPath.row].typeID
        cell.lblForName.text = self.arrayArtistData[indexPath.row].typeName
        cell.imgForArtist.image = UIImage(named: "")
        if let imageUrl = URL(string: self.arrayArtistData[indexPath.row].typeImg)
        {
            let request = URLSession.shared.dataTask(with: imageUrl) { ( imageData, response, error ) in
                guard let imageData = imageData else {return}
                
                DispatchQueue.main.async {
                    cell.imgForArtist.image = UIImage(data: imageData)
                    cell.imgForArtist.layer.masksToBounds = true
                    cell.imgForArtist.layer.borderWidth = 1.5
                    cell.imgForArtist.layer.borderColor = UIColor.yellow.cgColor
                    cell.imgForArtist.layer.cornerRadius = cell.imgForArtist.bounds.width/2
                    cell.lblForID.textColor = UIColor.init(red: 255, green: 215, blue: 0, alpha: 255)
                    cell.lblForName.textColor = UIColor.init(red: 255, green: 215, blue: 0, alpha: 255)
                }
            }
            request.resume()
        }
        return cell
    }
    
//    @IBAction func tapToViewCollectionList(_ sender: UIButton) {
//        let objCollectionVC = self.storyboard?.instantiateViewController(withIdentifier: "ArtistCollectionVC") as! ArtistCollectionVC
//        self.navigationController?.pushViewController(objCollectionVC, animated: true)
//    }
    
    //MARK: - Application
    func apiCallForList()
    {
        
            let urlString = "http://3.17.208.36/appointment/index.php/api/artistTypes"
       
            
            Alamofire.request(urlString, method: .post, parameters: [String:Any](),encoding: JSONEncoding.default, headers: nil).responseJSON {
                response in
                switch response.result {
                case .success:
                    print(response)
                    if let userData = response.result.value as? NSDictionary
                    {
                        let status = userData["success"] as! Int
                        let errorMessage = userData["message"] as! String
                        DispatchQueue.main.async(execute: {
                            if status == 1
                            {
                                if let artistData = userData["result"] as? [[String:Any]]
                                {
                                    for dict in artistData
                                    {
                                        let modelData = ArtistModel.init(dict: dict as NSDictionary)
                                        self.arrayArtistData.append(modelData)
                                    }
                                    self.mainListing.reloadData()
                                }

                                
                            }else {
//                                let objHomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//                                self.navigationController?.pushViewController(objHomeVC, animated: true)
                                let alert = UIAlertController(title: "Alert", message: errorMessage , preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                                self.present(alert, animated: true, completion: nil)
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
