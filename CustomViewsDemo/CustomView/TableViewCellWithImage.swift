//
//  TableViewCellWithImage.swift
//  CustomViewsDemo
//
//  Created by trinh.hoang.hai on 6/13/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class TableViewCellWithImage: UITableViewCell {

    @IBOutlet weak var displayImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
