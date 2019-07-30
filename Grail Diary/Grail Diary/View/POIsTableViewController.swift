//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Joseph Rogers on 7/29/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

var POIList: [POI] = []

class POIsTableViewController: UIViewController, UITableViewDelegate {
  
    

    @IBOutlet weak var TableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
 
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }
    }
    
}
extension POIsTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? POITableViewCell else {fatalError("Something failed")}
        
        return cell
    }
}
extension POIsTableViewController: AddPOIDelegate {
    func poiWasAdded(_ poi: POI) {
        POIList.append(poi)
        dismiss(animated: true)
       TableViewOutlet.reloadData()
    }
    }

