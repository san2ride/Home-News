//
//  Home+CoreDataClass.swift
//  Home News
//
//  Created by Jason Sanchez on 10/3/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


public class Home: NSManagedObject {
    private let isForSalePredicate = NSPredicate(format: "isForSale = false")
    private let request: NSFetchRequest<Home> = Home.fetchRequest()
    
    func totalSoldHomesValue(moc: NSManagedObjectContext) -> Double {
        request.predicate  = isForSalePredicate
        request.resultType = .dictionaryResultType
        
        let sumExpressionDescription = NSExpressionDescription()
        sumExpressionDescription.name = "totalSales"
        sumExpressionDescription.expression = NSExpression(forFunction: "sum:", arguments: [NSExpression(forKeyPath: "price")])
        sumExpressionDescription.expressionResultType = .doubleAttributeType
        
        request.propertiesToFetch = [sumExpressionDescription]
        
        if let results = try? moc.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as? [NSDictionary],
            let totalSales = results?.first?["totalSales"] as? Double {
            return totalSales
        }
        return 0 
    }
    
    func totalSoldCondo(moc: NSManagedObjectContext) -> Int {
        let typePredicate = NSPredicate(format: "homeType = '\(HomeType.Condo.rawValue)'")
        let predicate = NSCompoundPredicate(type: .and, subpredicates: [isForSalePredicate, typePredicate])
        
        request.resultType = .countResultType
        request.predicate = predicate
        
        if let results = try? moc.fetch(request as! NSFetchRequest<NSFetchRequestResult>) as? [Int],
            let count = results?.first {
            
            return count
        }
        return 0
    }
    
    func totalSoldSingleFamilyHome(moc: NSManagedObjectContext) -> Int {
        let typePredicate = NSPredicate(format: "homeType = '\(HomeType.SingleFamily.rawValue)'")
        let predicate = NSCompoundPredicate(type: .and, subpredicates: [isForSalePredicate, typePredicate])
        
        request.predicate = predicate
        
        if let count = try? moc.count(for: request), count != NSNotFound {
            return count
        }
        return 0 
    }
}
