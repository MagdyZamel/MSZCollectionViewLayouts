//
//  MasterVC.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/14/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

class MasterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func oneItemPerRowTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .oneItemPerRow
        self.navigationController!.pushViewController(vc, animated: true)
    }
    @IBAction func twoItemsPerRowInLandscapeTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .twoItemsPerRow
        self.navigationController!.pushViewController(vc, animated: true)
    }

    
}
