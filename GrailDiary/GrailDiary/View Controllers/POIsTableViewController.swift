//
//  POIsTableViewController.swift
//  GrailDiary
//
//  Created by Harmony Radley on 2/20/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
     var pois = [POI]()

        override func viewDidLoad() {
            super.viewDidLoad()
        }

        // MARK: - Navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "AddPOIModalSegue" {
                if let addPOIVC = segue.destination as? AddPOIViewController {
                    addPOIVC.delegate = self
                }
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = tableView.indexPathForSelectedRow,
                    let poiDetailVC = segue.destination as? POIDetailViewController {
                    poiDetailVC.poi = pois[indexPath.row]
                }
            }
        }
    }

    extension POIsTableViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return pois.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }

            let poi = pois[indexPath.row]
            cell.poi = poi

            return cell
        }
    }

    extension POIsTableViewController: AddPOIDelegate {
        func poiWasAdded(_ poi: POI) {

            pois.append(poi)

            dismiss(animated: true, completion: nil)

            tableView.reloadData()
        }
    }
 
    
    

    
