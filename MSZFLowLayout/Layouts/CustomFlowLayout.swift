//
//  CustomFlowLayout.swift
//  MSZFLowLayout
//
//  Created by MSZ on 11/10/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

extension PuppiesVC{
    func registerPuppiesCollectionViewCells()  {
        let puppyCell = UINib(nibName: "PuppyCell", bundle: nil)
        puppiesCollectionView.register(puppyCell, forCellWithReuseIdentifier: PuppyCell.className)
    }
    func confgPuppiesCollectionViewLayout() {
        
    }

}


class CustomFlowLayout: UICollectionViewFlowLayout {

    
}
