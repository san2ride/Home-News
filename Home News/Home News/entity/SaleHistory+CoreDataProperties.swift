//
//  SaleHistory+CoreDataProperties.swift
//  Home News
//
//  Created by Jason Sanchez on 10/3/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension SaleHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaleHistory> {
        return NSFetchRequest<SaleHistory>(entityName: "SaleHistory")
    }

    @NSManaged public var soldDate: NSDate?
    @NSManaged public var soldPrice: Double
    @NSManaged public var home: Home?

}
