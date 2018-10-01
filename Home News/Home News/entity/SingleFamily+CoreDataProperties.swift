//
//  SingleFamily+CoreDataProperties.swift
//  Home News
//
//  Created by Jason Sanchez on 10/1/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//
//

import Foundation
import CoreData


extension SingleFamily {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SingleFamily> {
        return NSFetchRequest<SingleFamily>(entityName: "SingleFamily")
    }

    @NSManaged public var lotSize: Int16

}
