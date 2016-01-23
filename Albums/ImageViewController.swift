//
//  ImageViewController.swift
//  Albums
//
//  Created by Chris Archibald on 1/23/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import Photos

class ImageViewController: UIViewController {
    
    var assetCollection = PHAssetCollection()
    var assetFetchResult = PHFetchResult()
    var index: Int = 0

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
