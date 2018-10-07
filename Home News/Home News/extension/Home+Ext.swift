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
    func getHomeByStatus(isForSale: Bool, filterBy filter: NSPredicate?, sortBy sort: [NSSortDescriptor], moc: NSManagedObjectContext) -> [Home] {
        let request: NSFetchRequest<Home> = Home.fetchRequest()
        var predicates = [NSPredicate]()
        
        let statusPredicate = NSPredicate(format: "isForSale = %@", NSNumber(value: isForSale))
        predicates.append(statusPredicate)
        
        if let additionalPredicate = filter {
            predicates.append(additionalPredicate)
        }
        
        let predicate = NSCompoundPredicate(type: .and, subpredicates: predicates)
        request.predicate = predicate
        request.sortDescriptors = sort.isEmpty ? nil : sort
        
        do {
            let homes = try moc.fetch(request)
            return homes
        }
        catch  let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}
