//
//  ViewController.swift
//  Albums
//
//  Created by Chris Archibald on 1/16/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController {
    
    var albumName: String!
    var photoAssets: PHFetchResult!
    var assetsCollection: PHAssetCollection!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

