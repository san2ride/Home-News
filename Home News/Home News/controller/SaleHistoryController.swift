//
//  SaleHistoryController.swift
//  Home News
//
//  Created by Jason Sanchez on 9/30/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

class SaleHistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Property
    private lazy var soldHistory = [SaleHistory]()
    var home: Home?
    weak var managedObjectContext: NSManagedObjectContext! {
        didSet {
            saleHistory = SaleHistory(context: managedObjectContext)
        }
    }
    
    private var saleHistory: SaleHistory?
    
    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSoldHistory()
        
        if let homeImage = home?.image as Data? {
            let image = UIImage(data: homeImage)
            imageView.image = image
            imageView.layer.borderWidth = 1
            imageView.layer.cornerRadius = 4
        }
    }
    // MARK: tableView dataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soldHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! SaleHistoryCell
        
        let saleHistory = soldHistory[indexPath.row]
        cell.configureCell(saleHistory: saleHistory)
        
        return cell
    }
    
    // MARK: Private
    private func loadSoldHistory() {
        guard let home = home, let saleHistory = saleHistory else { return }
        
        soldHistory = saleHistory.soldHistoryData(for: home, moc: managedObjectContext)
        tableView.reloadData()
    }
}
