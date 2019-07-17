//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by Jake Connerly on 7/17/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

//
// MARK: - Protocols
//

protocol AddPOIDelegate {
    func poiWasAdded(_ POI: POI)
}

class AddPOIViewController: UIViewController {

    //
    // MARK: - IBOutlets & Properties
    //
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    var delegate: AddPOIDelegate?
    
    //
    // IBActions & Methods
    //
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let location = locationTextField.text,
            let country = countryTextField.text else { return }
        
        var poi = POI(location: location, country: country, clues: [])
        
        if let clue1 = clue1TextField.text,
               !clue1.isEmpty {
            poi.clues.append(clue1)
        }
        
        if let clue2 = clue2TextField.text,
            !clue2.isEmpty {
            poi.clues.append(clue2)
        }
        
        if let clue3 = clue3TextField.text,
            !clue3.isEmpty {
            poi.clues.append(clue3)
        }
        
        delegate?.poiWasAdded(poi)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
} // <- end of AddPOITableView Class
extension AddPOIViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case locationTextField:
            countryTextField.becomeFirstResponder()
        case countryTextField:
            clue1TextField.becomeFirstResponder()
        case clue1TextField:
            clue2TextField.becomeFirstResponder()
        case clue2TextField:
            clue3TextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
}
