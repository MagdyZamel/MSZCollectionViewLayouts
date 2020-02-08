//
//  PuppyModel.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/9/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import Foundation
class PuppyModel {
  var name: String
  var title: String
  var description: String
  
  init(name: String,
       title: String,
       description: String) {
    
    self.name = name
    self.title = title
    self.description = description
  }
  
  convenience init(dictionary: NSDictionary) {
    let name = dictionary["name"] as? String
    let title = dictionary["title"] as? String
    let description = dictionary["description"] as? String
    
    self.init(name: name!,
              title: title!,
              description: description!)
  }
  
  class func loadPuppies() -> [PuppyModel] {
    var puppies = [PuppyModel]()
    if let path = Bundle.main.path(forResource: "PuppiesData", ofType: "plist") {
      if let dictArray = NSArray(contentsOfFile: path) {
        for item in dictArray {
          let puppy = PuppyModel(dictionary: item as! NSDictionary)
          puppies.append(puppy)
        }
      }
    }
    return puppies
  }
  
  
}

