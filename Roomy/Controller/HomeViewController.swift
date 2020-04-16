//
//  HomeViewController.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
   
    
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    
   //MARK:- Properties
    
    var auth:Auth?
    var rooms:[RoomsModel]?
    var room:RoomsModel?
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Rooms.requestAllRooms(auth!.token, completionHandler: handelRoomsRequest(data:error:))
      
    }
    
    
    
    
    
    //MARK:- Handel The Rooms Response
    func handelRoomsRequest(data:[RoomsModel]?,error:Error?){
        self.rooms = data
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
        }
    }
    
    
    
    
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "homeToInfo"
        {
            let vc = segue.destination as? ListingViewController
            vc?.room = sender as? RoomsModel
        }
    }

}





//MARK:- TableView

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return rooms?.count ?? 50
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        if rooms != nil {
            tableCell.priceLabel.text = self.rooms![indexPath.row].price
            tableCell.descriptionLabel.text = self.rooms![indexPath.row].title
            tableCell.placeLabel.text = self.rooms![indexPath.row].place
            if rooms![indexPath.row].image != nil{
                
                tableCell.firstImg.sd_setImage(with: URL(string: self.rooms![indexPath.item].image!))
            }
        }
        
        return  tableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if rooms != nil{
            let room = rooms![indexPath.row]
        self.performSegue(withIdentifier: "homeToInfo", sender: room)
        }
    }
    
}






