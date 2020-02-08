//
//  DynamicGalleryLayoutAttributes.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/14/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
import UIKit

class DynamicGalleryLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var imageHeight: CGFloat = 0
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! DynamicGalleryLayoutAttributes
        copy.imageHeight = imageHeight
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? DynamicGalleryLayoutAttributes {
            if attributes.imageHeight == imageHeight {
                return super.isEqual(object)
            }
        }
        return false
    }
    
}

extension PuppyCell {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? DynamicGalleryLayoutAttributes {
            imageHeightConstraint.constant = attributes.imageHeight
            // imageAcpectRatioConstraint  not related to DynamicGallery
            imageAcpectRatioConstraint.isActive = false
        } 
    }
    
}
