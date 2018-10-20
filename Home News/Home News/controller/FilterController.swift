//
//  FilterController.swift
//  Home News
//
//  Created by Jason Sanchez on 9/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

protocol FilterTableViewControllerDelegate: class {
    func updateHomeList(filterby: NSPredicate?, sortby: NSSortDescriptor?)
}

class FilterController: UITableViewController {
    
    // SORT BY
    @IBOutlet weak var sortByLocationCell: UITableViewCell!
    @IBOutlet weak var sortByPriceLowHighCell: UITableViewCell!
    @IBOutlet weak var sortByPriceHighLowCell: UITableViewCell!
    
    // FILTER BY home type
    @IBOutlet weak var filterByCondoCell: UITableViewCell!
    @IBOutlet weak var filterBySingleFamilyCell: UITableViewCell!
    
    // MARK: Properties
    private var sortDescriptor: NSSortDescriptor?
    private var searchPredicate: NSPredicate?
    weak var delegate: FilterTableViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            switch selectedCell {
            case sortByLocationCell:
                setSortDescriptor(sortBy: "city", isAscending: true)
                
            case sortByPriceLowHighCell:
                setSortDescriptor(sortBy: "price", isAscending: true)
                
            case sortByPriceHighLowCell:
                setSortDescriptor(sortBy: "price", isAscending: false)
                
            case filterByCondoCell, filterBySingleFamilyCell:
                setFilterSearchPredicate(filterBy: (selectedCell.textLabel?.text)!)
                
            default:
                break
            }
            
            selectedCell.accessoryType = .checkmark
            delegate.updateHomeList(filterby: searchPredicate, sortby: sortDescriptor)
        }
    }
    
    private func setSortDescriptor(sortBy: String, isAscending: Bool) {
        sortDescriptor = NSSortDescriptor(key: sortBy, ascending: isAscending)
    }
    
    private func setFilterSearchPredicate(filterBy: String) {
        searchPredicate = NSPredicate(format: "homeType = '\(filterBy)'")
    }
}
