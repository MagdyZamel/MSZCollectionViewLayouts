//
//  PuppyCell.swift
//  MSZFLowLayout
//
//  Created by MSZ on 11/9/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: self)
    }
}
class PuppyCell: UICollectionViewCell {

    @IBOutlet weak var puppyImage: UIImageView!
    @IBOutlet weak var puppyTitle: UILabel!
    @IBOutlet weak var puppyInfo: UILabel!
    @IBOutlet weak var puppyName: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.layer.cornerRadius = 6
      self.layer.borderWidth = 4
      self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        puppyImage.image = nil
        puppyTitle.text = ""
        puppyInfo.text = ""
    }
    
    func config(with puppy: PuppyModel) {
        puppyImage.image = UIImage(named: puppy.name)
        puppyName.text = puppy.name
        puppyTitle.text = puppy.title
        puppyInfo.text = puppy.description
    }
    
    

}
