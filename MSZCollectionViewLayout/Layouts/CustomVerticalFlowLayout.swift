//
//  CustomVerticalFlowLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/14/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit
class CustomVerticalFlowLayout:  UICollectionViewFlowLayout {
    
    var standardItemAlpha: CGFloat = 0.7
    var standardItemScale: CGFloat = 0.5
    
    var isSetup = false
    
    override func prepare() {
        super.prepare()
        if isSetup == false {
            setupCollectionView()
            isSetup = true
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            changeLayoutAttributes(itemAttributesCopy)
            
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)
        
        let center = collectionView!.bounds.size.height / 2
        // current Content Offset Center Origin
        let proposedContentOffsetCenterOrigin = proposedContentOffset.y + center
        // the closest y to  Center Origin
        let closest = layoutAttributes!.sorted { abs($0.center.y - proposedContentOffsetCenterOrigin) < abs($1.center.y - proposedContentOffsetCenterOrigin) }.first ?? UICollectionViewLayoutAttributes()
        
        let targetContentOffset = CGPoint(x: proposedContentOffset.x, y: floor(closest.center.y - center))
        
        return targetContentOffset
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.height/2
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let offset = collectionView!.contentOffset.y
        
        let realCenter = attributes.center.y - offset
        let distance = min(abs(collectionCenter - realCenter), maxDistance)
        let ratio = (maxDistance - distance)/maxDistance
        
        let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
        
        attributes.alpha = alpha
        attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        attributes.zIndex = Int(alpha * 10)
    }
    
    func setupCollectionView() {
        
        // after scaling all cells will have a 1-standardItemScale spaces between cells
        self.itemSize = CGSize(width: 400.0 * standardItemScale, height: 600.0 * standardItemScale)
        minimumLineSpacing = -itemSize.height*(1-standardItemScale)
        minimumInteritemSpacing = 0
        
        //To center contet in middle of collectionview
        guard let collectionView = collectionView else { return }
        let collectionSize = collectionView.bounds.size
        let yInset = (collectionSize.height - self.itemSize.height ) / 2
        let xInset = (collectionSize.width - self.itemSize.width ) / 2
        
        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
        
    }
    
    
}



