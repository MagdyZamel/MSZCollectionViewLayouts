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

    @IBAction func customRandomSizeFlowLayoutTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .randomSizeFlowLayout
        self.navigationController!.pushViewController(vc, animated: true)
    }
    @IBAction func customHorizontalFlowLayoutTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .customHorizontalFlowLayout
        self.navigationController!.pushViewController(vc, animated: true)
    }

    @IBAction func customVerticalFlowLayoutTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .customVerticalFlowLayout
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func dynamicGalleryLayoutTapped() {
            let vc = PuppiesVC()
        vc.layoutType = .dynamicGalleryLayout
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    @IBAction func transitionBettweenLayoutsTapped() {
        let vc = PuppiesVC()
        vc.layoutType = .transitionBettweenLayouts
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
}
