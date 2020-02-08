//
//  DynamicGalleryLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/14/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit

class DynamicGalleryLayout: UICollectionViewLayout {
    
    var delegate: DynamicGalleryLayoutDelegate!
    var numberOfColumns = 2
    var cellPadding: CGFloat = 2
    var cacheAttributes = [DynamicGalleryLayoutAttributes]()

    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentwidth: CGFloat {
        get {
            let insets = collectionView!.contentInset
            return collectionView!.bounds.width - (insets.left + insets.right)
        }
    }

    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentwidth, height: contentHeight)
    }
    
    override class var layoutAttributesClass : AnyClass {
        return DynamicGalleryLayoutAttributes.self
    }

    
    
    override func prepare() {
        if cacheAttributes.isEmpty {
            let columnWidth = contentwidth / CGFloat(numberOfColumns)
            
            //Calculate All start xOffsets for each Columns
            var xOffsets = [CGFloat]()
            for column in 0..<numberOfColumns {
                xOffsets.append(CGFloat(column) * columnWidth)
            }
            
            //inital first yOffsets by 0 for each Columns
            // last y for each column
            var yOffsets = [CGFloat](repeating: 0, count: numberOfColumns)
            var column = 0
            //calculate each yOffsets for each row
            for item in 0..<collectionView!.numberOfItems(inSection: 0) {
                let indexPath = IndexPath(item: item, section: 0)
                let itemWidth = columnWidth - (cellPadding * 2)

                let imageHeight = delegate.collectionView(collectionView!, heightForImageAtIndexPath: indexPath, withWidth: itemWidth)
                let textHeight = delegate.collectionView(collectionView!, heightForDescriptionAtIndexPath: indexPath, withWidth: itemWidth)
                let itemHeight = cellPadding + imageHeight + textHeight + cellPadding
                //frame =(x = 0, y = 0), size = (width = 207, height = 231))
                // insetFrame =  (x = 2, y = 2) , size = (width = 203, height = 227))
                let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: itemHeight)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                let attributes = DynamicGalleryLayoutAttributes(forCellWith: indexPath)
                attributes.frame = insetFrame
                attributes.imageHeight = imageHeight
                cacheAttributes.append(attributes)
                contentHeight = max(contentHeight, frame.maxY)
                yOffsets[column] = yOffsets[column] + itemHeight
                column = column >= (numberOfColumns - 1) ? 0 : column + 1

            }
        }
    }
    
        
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [DynamicGalleryLayoutAttributes]()
        for attributes in cacheAttributes {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }

    
    
    // use it when setLayouts
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cacheAttributes[indexPath.item]
    }

}
