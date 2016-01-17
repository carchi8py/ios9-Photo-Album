//
//  AlbumsTableViewController.swift
//  Albums
//
//  Created by Chris Archibald on 1/16/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import Photos

class AlbumsTableViewController: UITableViewController {
    
    var albumsCollections = PHFetchResult()
    var assetsCollections = PHAssetCollection()
    var photoAsset = PHFetchResult()
    
    var albumNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumsCollections = PHAssetCollection.fetchAssetCollectionsWithType(PHAssetCollectionType.Album, subtype: PHAssetCollectionSubtype.Any, options: nil)
        
        if albumsCollections.count > 0 {
            for i in 0...albumsCollections.count - 1 {
                assetsCollections = albumsCollections[i] as! PHAssetCollection
                let albumName = assetsCollections.localizedTitle!
                albumNames.append(albumName)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return albumNames.count > 0 ? 1 : 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return albumNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AblumsTableViewCell
        
        assetsCollections = albumsCollections[indexPath.row] as! PHAssetCollection
        photoAsset = PHAsset.fetchAssetsInAssetCollection(assetsCollections, options: nil)
        
        if photoAsset.count > 0 {
            let totalImages = photoAsset.count
            let randomIndex: Int = Int(arc4random_uniform(UInt32(photoAsset.count)))
            let asset: PHAsset = photoAsset[randomIndex] as! PHAsset
            
            PHImageManager.defaultManager().requestImageForAsset(asset, targetSize: PHImageManagerMaximumSize, contentMode: PHImageContentMode.AspectFit, options: nil, resultHandler: { (image: UIImage?, object: [NSObject: AnyObject]?) -> Void in
                
                cell.albumImage.image = image
                cell.albumCount.text = totalImages > 1 ? "\(totalImages) Images" : "\(totalImages) Image"
            })
        } else {
            cell.albumImage.image = UIImage(named: "imagePlaceholder")
            cell.albumCount.text = "0 Images"
        }
        cell.albumName.text = albumNames[indexPath.row]

        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
