//
//  DairyDataCell.swift
//  DIARY
//
//  Created by mac on 03/09/20.
//  Copyright © 2020 Ishant Tiwari. All rights reserved.
//

import UIKit

class DairyDataCell: UITableViewCell {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
