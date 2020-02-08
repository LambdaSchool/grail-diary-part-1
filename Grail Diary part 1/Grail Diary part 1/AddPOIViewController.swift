//
//  AddPOIViewController.swift
//  Grail Diary part 1
//
//  Created by Osha Washington on 11/21/19.
//  Copyright © 2019 Osha Washington. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func poiWasAdded(_ poi: POI)
}

class AddPOIViewController: UITableViewController {

    
    // - OUTLETS **
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var CountryTextField: UITextField!
    @IBOutlet var clue1TextField: UITextField!
    @IBOutlet var clue2TextField: UITextField!
    @IBOutlet var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
                @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
            dismiss(animated: true, completion: nil)
        }
        @IBAction func saveTapped(_ sender: UIBarButtonItem) {
            guard let location = locationTextField.text,
                  let country = CountryTextField.text,
                    !location.isEmpty,
                    !country.isEmpty else { return }
            
            var poi = POI(location: location, country: country, clues: [] )

            if let clue1 = clue1TextField.text, !clue1.isEmpty {
                poi.clues.append(clue1)
            }
            
            if let clue2 = clue2TextField.text, !clue2.isEmpty {
                poi.clues.append(clue2)
            }
            
            if let clue3 = clue3TextField.text, !clue3.isEmpty {
                poi.clues.append(clue3)
            }
            delegate?.poiWasAdded(poi)
        }
}

extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let text = textField.text, !text.isEmpty{
            switch textField {
            case locationTextField:
                CountryTextField.becomeFirstResponder()
            case CountryTextField:
                clue1TextField.becomeFirstResponder()
            case clue1TextField:
                clue2TextField.becomeFirstResponder()
            case clue2TextField:
                clue3TextField.becomeFirstResponder()
            default:  textField.resignFirstResponder()
            }
        }
        return false
    }
}
