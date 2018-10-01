//
//  Condo+CoreDataProperties.swift
//  Home News
//
//  Created by Jason Sanchez on 10/1/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension Condo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Condo> {
        return NSFetchRequest<Condo>(entityName: "Condo")
    }

    @NSManaged public var unitsPerBuilding: Int16

}
