//
//  ViewController.swift
//  Albums
//
//  Created by Chris Archibald on 1/16/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var albumName: String!
    var photoAssets: PHFetchResult!
    var assetsCollection: PHAssetCollection!
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = albumName
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: Collection View Data Source Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoAssets.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! AlbumCollectionViewCell
        
        let asset: PHAsset = photoAssets[indexPath.row] as! PHAsset
        PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options: nil) { (image: UIImage?, object: [NSObject: AnyObject]?) -> Void in
            cell.imageView.image = image
            
        }
        return cell
    }


}

