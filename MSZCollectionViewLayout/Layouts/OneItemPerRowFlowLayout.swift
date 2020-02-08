//
//  OneCellPerRowFlowLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/13/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit
class OneItemPerRowFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView  = collectionView else { return }

        self.minimumLineSpacing = 20
        self.minimumInteritemSpacing = 1
        self.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromContentInset
        let availableWidth = collectionView.bounds.inset(by: sectionInset).size.width
        self.itemSize = CGSize.init(width: availableWidth, height: 70)


    }
    
}
