//
//  POITableViewCell.swift
//  grail-diary-part-1
//
//  Created by Samuel Esserman on 2/18/20.
//  Copyright © 2020 Samuel Esserman. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesCountLabel: UILabel!
    
    var poi: POI? {
    didSet {
       updateViews()
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
        private func updateViews() {
                if let poi = poi {
                    locationLabel.text = poi.location
                    countryLabel.text = poi.country
                    cluesCountLabel.text = "\(poi.clues.count)"
                    
                }
            }

        }
}
