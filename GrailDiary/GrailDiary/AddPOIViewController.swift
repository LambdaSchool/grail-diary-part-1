//
//  AddPOIViewController.swift
//  GrailDiary
//
//  Created by ronald huston jr on 4/16/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

protocol AddPOIDelegate {
    func pointWasAdded(point: POI)
}

class AddPOIViewController: UIViewController {
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let locationText = locationTextField.text,
            let countryText = countryTextField.text,
            !locationText.isEmpty,
            !countryText.isEmpty
            else { return }
        
        var poi: POI = POI(location: locationText, country: countryText, clues: [])
        
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
        delegate?.pointWasAdded(point: poi)
    }
    var delegate: AddPOIDelegate?
}

extension AddPOIViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            switch textField.placeholder {
            case "Location":
                locationTextField.resignFirstResponder()
                countryTextField.becomeFirstResponder()
            case "Country":
                countryTextField.resignFirstResponder()
                clue1TextField.becomeFirstResponder()
            case "Clue 1":
                clue1TextField.resignFirstResponder()
                clue2TextField.becomeFirstResponder()
            case "Clue 2":
                clue2TextField.resignFirstResponder()
                clue3TextField.becomeFirstResponder()
            case "Clue 3":
                clue3TextField.resignFirstResponder()
            default:
                break
            }
        }
    return true
    }
}
