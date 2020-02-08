//
//  PuppyCell.swift
//  MSZCollectionViewLayout
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
    @IBOutlet weak var puppyName: UILabel!

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      self.layer.cornerRadius = 4
      self.layer.borderWidth = 3
      self.layer.borderColor = UIColor(red:  19/255, green: 24/255, blue: 30/255, alpha: 1.0).cgColor
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        puppyImage.image = nil
        puppyTitle.text = ""
        puppyName.text = ""
    }
    
    func config(with puppy: PuppyModel) {
        puppyImage.image = UIImage(named: puppy.name)
        puppyName.text = puppy.name
        puppyTitle.text = puppy.description
    }
    
    

}
