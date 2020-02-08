//
//  CustomHorizontalFlowLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/14/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit

class CustomHorizontalFlowLayout:  UICollectionViewFlowLayout {

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

    func setupCollectionView() {
        scrollDirection = .horizontal
        // after scaling all cells will have a 1-standardItemScale spaces between cells
        self.itemSize = CGSize(width: 400.0 * standardItemScale, height: 600.0 * standardItemScale)
        minimumLineSpacing = -itemSize.width*(1-standardItemScale)
        //To center contet in middle of collectionview
        guard let collectionView = collectionView else { return }
        let collectionSize = collectionView.bounds.size
        // 80 refers to save area height
        let yInset = (collectionSize.height - self.itemSize.height - 80 ) / 2
        let xInset = (collectionSize.width - self.itemSize.width ) / 2
        self.sectionInset = UIEdgeInsets(top: yInset, left: xInset, bottom: yInset, right: xInset)
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


    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.width/2
        let contentOffset = collectionView!.contentOffset
        let normalizedCenter = attributes.center.x - contentOffset.x

        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        let ratio = (maxDistance - distance)/maxDistance

        let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale

        attributes.alpha = alpha
        attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
        attributes.zIndex = Int(alpha * 10)

    }


    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        print(proposedContentOffset)
        let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)

        let collectionViewXCenter = collectionView!.bounds.size.width / 2
        // current Content Offset Center Origin
        let proposedx = proposedContentOffset.x + collectionViewXCenter
        // the closest x to  Center Origin
        let  closest = layoutAttributes!.sorted {
            abs($0.center.x - proposedx ) < abs($1.center.x - proposedx)

        }.first ?? UICollectionViewLayoutAttributes()

        let targetContentOffset = CGPoint(x:floor(closest.center.x - collectionViewXCenter) , y: proposedContentOffset.y)

        return targetContentOffset
    }


    
}

