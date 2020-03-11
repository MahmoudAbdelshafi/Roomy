//
//  HomeTableViewCell.swift
//  Roomy
//
//  Created by Mahmoud on 3/9/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {


   
    @IBOutlet weak var homeCollectionView: UICollectionView!

  
 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}



let imageArray = [UIImage(named: "Room"),UIImage(named: "room1"),UIImage(named: "room2"),UIImage(named: "room3"),UIImage(named: "room4"),UIImage(named: "room5"),UIImage(named: "room6"),UIImage(named: "room7"),UIImage(named: "room8"),UIImage(named: "room9"),UIImage(named: "room10")]

extension HomeTableViewCell :UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
   
  
    cell.img.image = imageArray[indexPath.item]
    

    
    
    
    
    return cell
    }

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 90)
}
    
    
}
