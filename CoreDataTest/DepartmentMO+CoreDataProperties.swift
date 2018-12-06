//
//  DepartmentMO+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Melanie on 11/6/18.
//
//

import Foundation
import CoreData


extension DepartmentMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DepartmentMO> {
        return NSFetchRequest<DepartmentMO>(entityName: "Department")
    }

    @NSManaged public var address: String?
    @NSManaged public var zipCode: Int32
    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var employees: NSSet?

}

// MARK: Generated accessors for employees
extension DepartmentMO {

    @objc(addEmployeesObject:)
    @NSManaged public func addToEmployees(_ value: EmployeeMO)

    @objc(removeEmployeesObject:)
    @NSManaged public func removeFromEmployees(_ value: EmployeeMO)

    @objc(addEmployees:)
    @NSManaged public func addToEmployees(_ values: NSSet)

    @objc(removeEmployees:)
    @NSManaged public func removeFromEmployees(_ values: NSSet)
    
    static func insertNewDepartment(address: String, city: String, name: String, zipCode: Int32) -> DepartmentMO? {
        let department = NSEntityDescription.insertNewObject(forEntityName: "Department", into: AppDelegate.managedObjectConext!) as! DepartmentMO
        department.address = address
        department.city = city
        department.name = name
        department.zipCode = zipCode
        
        do {
            try AppDelegate.managedObjectConext?.save()
        } catch {
            let error = error as NSError
            print(error)
            return nil
        }
        print(department.name)
        return department
    }

}
