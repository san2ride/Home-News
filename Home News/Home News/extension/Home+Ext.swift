//
//  Home+Ext.swift
//  Home News
//
//  Created by Jason Sanchez on 10/3/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation
import CoreData

extension Home {
    func getHomeByStatus(isForSale: Bool, moc: NSManagedObjectContext) -> [Home] {
        let request: NSFetchRequest<Home> = Home.fetchRequest()
        request.predicate = NSPredicate(format: "isForSale = %@", NSNumber(value: isForSale))
        
        do {
            let homes = try moc.fetch(request)
            return homes
        }
        catch  let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
