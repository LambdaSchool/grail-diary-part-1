//
//  POITableViewCell.swift
//  GrailDiary
//
//  Created by Ryan Dutson on 7/17/19.
//  Copyright © 2019 Ryan Dutson. All rights reserved.
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
    }

    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesCountLabel.text = "\(poi.clues.count) clues"
    }
}
