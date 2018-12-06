//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Melanie on 11/6/18.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let insertButton: UIButton! = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertButton.backgroundColor = .green
        insertButton.setTitle("fdsfsd", for: .normal)
        insertButton.frame = CGRect(x: 0, y: 0, width: 120, height: 40)
        insertButton.center = view.center
        insertButton.addTarget(self, action: #selector(insertAction), for: .touchUpInside)
        self.view.addSubview(insertButton)
        getEmployees()
    }
    
    private func deleteAllEmployees() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let requestDel = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        do {
            let arrUsrObj = try context.fetch(requestDel)
            for usrObj in arrUsrObj as! [NSManagedObject] { // Fetching Object
                context.delete(usrObj) // Deleting Object
            }
        } catch {
            print("Failed")
        }
        
        // Saving the Delete operation
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }

    }
    
    private func getEmployees() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
    }

    @objc func insertAction() {
        let department = DepartmentMO.insertNewDepartment(address: "dasdasd", city: "qweqw", name: "qwew12", zipCode: 12)
        var employees = Set<EmployeeMO>()
        if let employee1 = EmployeeMO.insertNewEmployee(name: "sdsdsd", date: NSDate(), hireDate: NSDate(), identifier: "1", isManager: true, title: "124fd"){
            employee1.department = department
            employees.insert(employee1)
        }
        
        if let employee2 = EmployeeMO.insertNewEmployee(name: "sdsdsd1", date: NSDate(), hireDate: NSDate(), identifier: "2", isManager: true, title: "124fd"){
            employee2.department = department
            employees.insert(employee2)
        }
        
        department?.addToEmployees(employees as NSSet)
        
    }

}

