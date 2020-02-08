//
//  PuppiesVC.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/9/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit

class PuppiesVC: UIViewController {
    enum LayoutType {
        case randomSizeFlowLayout
        case customHorizontalFlowLayout
        case customVerticalFlowLayout
        case dynamicGalleryLayout
        case transitionBettweenLayouts
    }
    
    
    @IBOutlet weak var puppiesCollectionView: UICollectionView!
    @IBOutlet weak var bar: UIView!
    
    let puppies = PuppyModel.loadPuppies().shuffled()
    var layoutType: LayoutType = LayoutType.customHorizontalFlowLayout
    var randomSizeFlowLayout = RandomSizeFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerPuppiesCollectionViewCells()

        // Initial Flow Layout
        switch  layoutType {
        case .randomSizeFlowLayout:
            initRandomSizeFlowLayout()
        case .customHorizontalFlowLayout:
            initCustomHorizontalFlowLayout()
        case .customVerticalFlowLayout:
             initCustomVerticalFlowLayout()
        case .dynamicGalleryLayout:
            initDynamicGalleryLayout()
        case .transitionBettweenLayouts:
            bar.isHidden = false
                initDynamicGalleryLayout()
        }
        
    }
    
    
    
    func registerPuppiesCollectionViewCells()  {
        let puppyCell = UINib(nibName: "PuppyCell", bundle: nil)
        puppiesCollectionView.register(puppyCell, forCellWithReuseIdentifier: PuppyCell.className)
    }
    
    func initRandomSizeFlowLayout() {
        let layout =  UICollectionViewFlowLayout()
        puppiesCollectionView.collectionViewLayout = layout
        puppiesCollectionView.delegate = randomSizeFlowLayout
    }

    func initHorizontalFlowLayout() {
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        puppiesCollectionView.collectionViewLayout = layout
    }
    
    func initCustomHorizontalFlowLayout() {
        let layout =  CustomHorizontalFlowLayout()
        puppiesCollectionView.collectionViewLayout = layout
        puppiesCollectionView.delegate = nil
    }

    func initCustomVerticalFlowLayout() {
        let layout =  CustomVerticalFlowLayout()
        puppiesCollectionView.collectionViewLayout = layout
        puppiesCollectionView.delegate = nil
    }
    func initDynamicGalleryLayout() {
        let layout =  DynamicGalleryLayout()
        layout.delegate = self
        puppiesCollectionView.collectionViewLayout = layout
    }
    
    
    
    @IBAction func verticalFlowLayoutButtonAction(_ sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
        puppiesCollectionView.collectionViewLayout.invalidateLayout()
        puppiesCollectionView.setCollectionViewLayout(layout, animated: true)
        puppiesCollectionView.reloadData()
    }
    @IBAction func horizontalflowLayoutButtonAction(_ sender: UIButton) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        puppiesCollectionView.collectionViewLayout.invalidateLayout()
        puppiesCollectionView.setCollectionViewLayout(layout, animated: true)
        puppiesCollectionView.reloadData()
    }

    @IBAction func dynamicGalleryLayoutButtonAction(_ sender: UIButton) {
        let layout =  DynamicGalleryLayout()
        layout.delegate = self
        puppiesCollectionView.collectionViewLayout.invalidateLayout()
        puppiesCollectionView.setCollectionViewLayout(layout, animated: true)
        puppiesCollectionView.reloadData()
    }

}


// MARK: UICollectionViewDataSource
extension PuppiesVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return puppies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PuppyCell.className, for: indexPath) as! PuppyCell
        
        // Configure the cell
        let puppy = puppies[indexPath.item]
        cell.config(with: puppy)
        return cell
    }
}


