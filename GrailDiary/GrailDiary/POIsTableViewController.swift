//
//  ViewController.swift
//  GrailDiary
//
//  Created by Karen Rodriguez on 2/18/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        POITable.delegate = self as? UITableViewDelegate
        POITable.dataSource = self as? UITableViewDataSource
    }

    var models: [POI] = []
    
    @IBOutlet weak var POITable: UITableView!

    
    


}

// Delegate and DataSource functionality

extension POITableViewCell: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath)
        
        cell.textLabel?.text = "We testing"
        
        return cell
        
    }
}
