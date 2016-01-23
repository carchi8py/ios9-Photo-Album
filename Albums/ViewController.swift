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
        self.automaticallyAdjustsScrollViewInsets = false
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
    
    //Mark Collection View Cells Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = self.view.frame.width
        //2 is the spacing between cell
        //3 is the space inbetween 3 cells
        let sizeDimension = (width - 2  * 3) / 3
        
        return CGSizeMake(sizeDimension, sizeDimension)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 2.0
    }
    
    //Mark: -- Seque
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage" {
            let controller: ImageViewController = segue.destinationViewController as! ImageViewController
            controller.index = self.collectionView.indexPathForCell(sender as! UICollectionViewCell)!.item
            
            controller.assetFetchResult = self.photoAssets
            controller.assetCollection = self.assetsCollection
        }
    }


}

