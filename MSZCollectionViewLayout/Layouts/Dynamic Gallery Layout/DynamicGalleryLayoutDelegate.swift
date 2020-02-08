//
//  CustomFlowLayout.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/10/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit
import AVFoundation

protocol DynamicGalleryLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
    
    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

extension PuppiesVC: DynamicGalleryLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let puppy = puppies[indexPath.item]
        let image = UIImage(named: puppy.name)
        let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        // insideRect : The bounding rectangle you want to fit into.
        let rect = AVMakeRect(aspectRatio: image!.size, insideRect: boundingRect)
        return rect.height
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForDescriptionAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let puppy = puppies[indexPath.item]
        let descriptionHeight = heightForText(puppy.description, width: width-24)
        // 24 title //  15 subtitle // 8 top
        let height = 4 + 24 + 8 + 15 + 8 + descriptionHeight + 12
        return height
    }
    
    func heightForText(_ text: String, width: CGFloat) -> CGFloat {
        let font = UIFont.systemFont(ofSize: 10)
        let rect = NSString(string: text).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)),
                                                       options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font],
                                                       context: nil)
        return ceil(rect.height)
    }
}
extension PuppiesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns = 2
        let cellPadding: CGFloat = 2
        let insets = collectionView.contentInset

        let columnWidth = (collectionView.bounds.width - (insets.left + insets.right)) / CGFloat(numberOfColumns)

        let width = columnWidth - (cellPadding * 2)

        return CGSize(width: width, height:width+200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets.init(top: 12, left: 2, bottom: 0, right: 2)
    }
}
