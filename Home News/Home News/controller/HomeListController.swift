//
//  HomeListController.swift
//  Home News
//
//  Created by Jason Sanchez on 9/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

class HomeListController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    weak var managedObjectContext: NSManagedObjectContext! {
        didSet {
            return home = Home(context: managedObjectContext)
        }
    }
    
    private lazy var homes = [Home]()
    private var home: Home? = nil
    private var isForSale: Bool = true
    private var selectedHome: Home?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    // MARK: Segmented Control
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let selectedValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
        isForSale = selectedValue == "For Sale" ? true : false
        loadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeListCell
        
        let currentHome = homes[indexPath.row]
        cell.configureCell(home: currentHome)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "segueHistory":
            let destination = segue.destination as! SaleHistoryController
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedHome = homes[selectedIndexPath.row]
                destination.home = selectedHome
                destination.managedObjectContext = managedObjectContext
            }
        case "segueToFilter":
            break
            
        default:
            break
        }
    }
    
    // MARK: Private
    
    private func loadData() {
        if let arrHomes = home?.getHomeByStatus(isForSale: isForSale, moc: managedObjectContext) {
            homes = arrHomes
            tableView.reloadData()
        }
    }
}
