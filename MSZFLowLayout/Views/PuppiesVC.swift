//
//  PuppiesVC.swift
//  MSZFLowLayout
//
//  Created by MSZ on 11/9/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

class PuppiesVC: UIViewController {
    @IBOutlet weak var puppiesCollectionView: UICollectionView!
    let puppies = PuppyModel.loadPuppies()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerPuppiesCollectionViewCells()
        confgPuppiesCollectionViewLayout()
        // Initial Flow Layout Setup
        
    }
    
}


// MARK: UICollectionViewDataSource
extension PuppiesVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return puppies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PuppyCell", for: indexPath) as! PuppyCell
        
        // Configure the cell
        let puppy = puppies[indexPath.item]
        cell.config(with: puppy)
        return cell
    }
}


