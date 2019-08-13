//
//  ViewController.swift
//  Grail Diary Part 1 - Auto Layout
//
//  Created by Andrew Ruiz on 8/13/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class CluesTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupNavBar()
        
    }
    
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

