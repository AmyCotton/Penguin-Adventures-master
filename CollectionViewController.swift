//
//  CollectionViewController.swift
//  Penguin Adventures
//
//  Created by Amy Cotton on 22/12/2015.
//  Copyright © 2015 Amy Cotton. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class CollectionViewController: UICollectionViewController {
    
    var Array = [String]()
    var ButtonArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Array = ["jgwrkg","fdk","jskgf","jkfgwnwjk","jskgf","jkfgwnwjk"]
        
        ButtonArray = ["jgwrkg","fdk","jskgf","jkfgwnwjk","jskgf","jkfgwnwjk"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Array.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
       let Label = cell.viewWithTag(1) as! UILabel
        
        Label.text = Array[indexPath.row]
        
        let Button = cell.viewWithTag(2) as! UIButton
        
        Button.setTitle(ButtonArray[indexPath.row], forState: UIControlState.Normal)
        
        return cell
    }
    
}