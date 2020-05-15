//
//  POIDetailViewController.swift
//  Grail Diary Part 1
//
//  Created by Dillon P on 7/29/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    @IBOutlet weak var landmarkImage: UIImageView!
    
    // MARK: - Properties
    
    var poi: POI?
    
    // MARK: - Functions
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = "\(poi.clues.joined(separator: ". "))."
        let image = poi.landmark
        landmarkImage.image = UIImage(named: "\(image)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}
