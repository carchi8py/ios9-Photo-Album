//
//  AblumsTableViewCell.swift
//  Albums
//
//  Created by Chris Archibald on 1/16/16.
//  Copyright © 2016 Chris Archibald. All rights reserved.
//

import UIKit

class AblumsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var albumCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
