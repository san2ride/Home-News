//
//  Home+CoreDataProperties.swift
//  Home News
//
//  Created by Jason Sanchez on 10/1/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension Home {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Home> {
        return NSFetchRequest<Home>(entityName: "Home")
    }

    @NSManaged public var bath: Int16
    @NSManaged public var bed: Int16
    @NSManaged public var city: String?
    @NSManaged public var homeType: String?
    @NSManaged public var image: NSData?
    @NSManaged public var isForSale: Bool
    @NSManaged public var price: Double
    @NSManaged public var sqft: Int16
    @NSManaged public var saleHistory: SaleHistory?

}
