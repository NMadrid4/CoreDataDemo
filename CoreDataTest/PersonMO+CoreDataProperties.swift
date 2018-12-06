//
//  PersonMO+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Melanie on 11/6/18.
//
//

import Foundation
import CoreData


extension PersonMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonMO> {
        return NSFetchRequest<PersonMO>(entityName: "Person")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var name: String?

}
