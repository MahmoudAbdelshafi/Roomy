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
    //MARK:- Properties
    var auth:Auth?
    var rooms:[RoomsModel]?
    var room:RoomsModel?
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCustomCells()
        request()
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

//MARK:- TableView Deleget Methods
extension HomeViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if rooms != nil{
            let room = rooms![indexPath.row]
            self.performSegue(withIdentifier: "homeToInfo", sender: room)
        }
    }
}

//MARK:- TableView DataSource Methods
extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "roomsCell", for: indexPath) as! HomeTableViewCell
        if rooms != nil {
            tableCell.priceLabel.text = self.rooms![indexPath.row].price
            tableCell.descriptionLabel.text = self.rooms![indexPath.row].title
            tableCell.placeLabel.text = self.rooms![indexPath.row].place
            //            if rooms![indexPath.row].image != nil{
            //                tableCell.firstImg.sd_setImage(with: URL(string: self.rooms![indexPath.item].image!))
            //
            //            }
        }
        return  tableCell
    }
    // Cell hieght method
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

//MARK:- Private Functions
extension HomeViewController{
    //MARK:- Handel The Rooms Response
    private func handelRoomsRequest(data:[RoomsModel]?,error:Error?){
        self.rooms = data
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
            RealmManager.saveRooms(rooms: self.rooms!)
        }
    }
    
    private func registerCustomCells() {
        let cell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(cell, forCellReuseIdentifier: "roomsCell")
    }
    
    private func request(){
        if auth != nil{
            Rooms.requestAllRooms(auth!.token, completionHandler: handelRoomsRequest(data:error:))
        }else{
            rooms = RealmManager.fetchRooms()
            self.homeTableView.reloadData()
            return
        }
    }
}
