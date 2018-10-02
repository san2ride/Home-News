//
//  SummaryController.swift
//  Home News
//
//  Created by Jason Sanchez on 9/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

class SummaryController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var totalSalesDollarLabel: UILabel!
    @IBOutlet weak var numCondoSoldLabel: UILabel!
    @IBOutlet weak var numSFSoldLabel: UILabel!
    @IBOutlet weak var minPriceHomeLabel: UILabel!
    @IBOutlet weak var maxPriceHomeLabel: UILabel!
    @IBOutlet weak var avgPriceCondoLabel: UILabel!
    @IBOutlet weak var avgPriceSFLabel: UILabel!
    
    
    // MARK: Properties
    private var home: Home?
    
    weak var managedObjectContext: NSManagedObjectContext! {
        didSet {
            return home = Home(context: managedObjectContext)
        }
    }
    
    private var soldPredicate: NSPredicate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        
        switch section {
        case 0:
            rowCount = 3
        case 1, 2:
            rowCount = 2
        default:
            rowCount = 0
        }
        
        return rowCount
    }
}
