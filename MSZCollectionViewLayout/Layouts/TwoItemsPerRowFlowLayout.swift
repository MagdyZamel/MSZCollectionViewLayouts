//
//  TwoCellsPerRowFlowLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/13/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit



class TwoItemsPerRowFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView  = collectionView else { return }
        self.minimumLineSpacing = 20
        self.minimumInteritemSpacing = 1
        self.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
        var availableWidth = collectionView.bounds.inset(by: sectionInset).size.width
        let minCellWidth = CGFloat(300)
        let maxColumn  =  Int(availableWidth/minCellWidth)
        availableWidth = availableWidth-(CGFloat(maxColumn)*minimumLineSpacing)
        let itemWidth = (availableWidth/CGFloat(maxColumn)).rounded(.down)
        self.itemSize = CGSize.init(width: itemWidth, height: 70)

    }
    
}
