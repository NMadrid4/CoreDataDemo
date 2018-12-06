//
//  EmployeeMO+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Melanie on 11/6/18.
//
//

import Foundation
import CoreData


extension EmployeeMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeMO> {
        return NSFetchRequest<EmployeeMO>(entityName: "Employee")
    }

    @NSManaged public var hireDate: NSDate?
    @NSManaged public var identifier: String?
    @NSManaged public var isManager: Bool
    @NSManaged public var title: String?
    @NSManaged public var department: DepartmentMO?

    
    static func insertNewEmployee(name: String,date: NSDate, hireDate: NSDate, identifier: String, isManager: Bool, title: String) -> EmployeeMO? {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: AppDelegate.managedObjectConext!) as! EmployeeMO
        employee.name = name
        employee.date = date
        employee.hireDate = hireDate
        employee.identifier = identifier
        employee.isManager = isManager
        employee.title = title
        
        do {
            try AppDelegate.managedObjectConext?.save()
        } catch  {
            let error = error as NSError
            print(error)
            return nil
        }
        
        print(employee.name)
        return employee
    }
}
