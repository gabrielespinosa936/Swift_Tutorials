//
//  ArtistCollectionVC.swift
//  JAPI1
//
//  Created by Gabriel Espinosa on 12/15/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import UIKit
import Alamofire

class CollectionArtistCell : UICollectionViewCell {

    @IBOutlet weak var imgArtist: UIImageView!
    
}

class ArtistCollectionVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    @IBOutlet weak var artistCollection: UICollectionView!
    var arrayArtistData = [ArtistModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view
        self.apiCallForList()
    }
    
    // CAN WE PUT STRIPPER AS ARTIST? OR XCODE WONT ALLOW?
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayArtistData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionArtistCell", for: indexPath) as! CollectionArtistCell
        cell.imgArtist.image = UIImage(named: "")
        if let imageUrl = URL(string: self.arrayArtistData[indexPath.row].typeImg)
        {1
            let request = URLSession.shared.dataTask(with: imageUrl) { ( imageData, response, error ) in
                guard let imageData = imageData else {return}
                
                DispatchQueue.main.async {
                    cell.imgArtist.image = UIImage(data: imageData)
//                    cell.imgForArtist.layer.masksToBounds = true
//                    cell.imgForArtist.layer.borderWidth = 1.5
//                    cell.imgForArtist.layer.borderColor = UIColor.yellow.cgColor
//                    cell.imgForArtist.layer.cornerRadius = cell.imgForArtist.bounds.width/2
//                    cell.lblForID.textColor = UIColor.init(red: 255, green: 215, blue: 0, alpha: 255)
//                    cell.lblForName.textColor = UIColor.init(red: 255, green: 215, blue: 0, alpha: 255)
                }
            }
            request.resume()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // This function gets the size of the cell dynamically height and width as per device sizes
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space : CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0.0 ) + (flowLayout?.sectionInset.left ??
        0.0) + (flowLayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (artistCollection.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
        
        
    }
    
    
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
                                self.artistCollection.reloadData()
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
