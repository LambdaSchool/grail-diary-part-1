//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Violet Lavender Love on 5/14/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var cluesLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
