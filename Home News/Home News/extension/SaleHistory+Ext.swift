//
//  SaleHistory+Ext.swift
//  Home News
//
//  Created by Jason Sanchez on 10/7/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation
import CoreData

extension SaleHistory {
    func soldHistoryData(for home: Home, moc: NSManagedObjectContext) -> [SaleHistory] {
        let soldHistoryRequest: NSFetchRequest<SaleHistory> = SaleHistory.fetchRequest()
        soldHistoryRequest.predicate = NSPredicate(format: "home = %@", home)
        
        do {
            let soldHistory = try moc.fetch(soldHistoryRequest)
            return soldHistory
        }
        catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
