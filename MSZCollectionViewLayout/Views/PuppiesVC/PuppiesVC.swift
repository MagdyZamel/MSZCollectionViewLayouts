//
//  PuppiesVC.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/9/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

class PuppiesVC: UIViewController {
    enum LayoutType {
        case twoItemsPerRow
        case oneItemPerRow
    }
    
    
    @IBOutlet weak var puppiesCollectionView: UICollectionView!
    
    let puppies = PuppyModel.loadPuppies().shuffled()
    var layoutType: LayoutType = LayoutType.oneItemPerRow
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerPuppiesCollectionViewCells()

        // Initial Flow Layout
        switch  layoutType {
        case .oneItemPerRow:
            initOneItemPerRowLayout()
        case .twoItemsPerRow:
            initTwoItemsPerRowLayout()
        }
        puppiesCollectionView.delegate = self
        
    }
    
    
    
    func registerPuppiesCollectionViewCells()  {
        let puppyCell = UINib(nibName: "PuppyCell", bundle: nil)
        puppiesCollectionView.register(puppyCell, forCellWithReuseIdentifier: PuppyCell.className)
    }
    
    func initOneItemPerRowLayout() {
        let layout =  OneItemPerRowFlowLayout()
        puppiesCollectionView.collectionViewLayout = layout
    }

    func initTwoItemsPerRowLayout() {
        let layout =  TwoItemsPerRowFlowLayout()
        puppiesCollectionView.collectionViewLayout = layout
    }

}


// MARK: UICollectionViewDataSource
extension PuppiesVC: UICollectionViewDataSource ,UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return puppies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PuppyCell.className, for: indexPath) as! PuppyCell
        print("dequeueReusableCell \(indexPath)")
        // Configure the cell
        let puppy = puppies[indexPath.item]
        cell.config(with: puppy)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("------ willDisplay \(indexPath)")
    }
}


