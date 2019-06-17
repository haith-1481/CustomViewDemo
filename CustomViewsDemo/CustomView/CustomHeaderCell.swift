//
//  CustomHeaderCell.swift
//  CustomViewsDemo
//
//  Created by trinh.hoang.hai on 6/13/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

    var reloadSections: ((_ section: Int) -> Void)?
    var shouldDisplayCells: Bool?
    var section: Int = 0

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHeader)))
    }

    @objc private func didTapHeader() {
        self.reloadSections?(section)
    }
    
}
