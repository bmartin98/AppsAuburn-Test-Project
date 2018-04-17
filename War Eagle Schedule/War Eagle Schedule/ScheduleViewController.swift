//
//  ScheduleViewController.swift
//  War Eagle Schedule
//
//  Created by Brandon Martin on 4/13/18.
//  Copyright © 2018 Brandon Martin. All rights reserved.
//

import Foundation
import UIKit

class ScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func backB(_ sender: UIButton) {
        performSegue(withIdentifier: "Back", sender: self)
    }
   
    @IBOutlet weak var tableView: UITableView!
    var eventArray: [scheduleEvent] = []
    var day: String = ""
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.data(forKey: day) != nil {
            let temp = UserDefaults.standard.data(forKey: day)!
//            eventArray = NSKeyedUnarchiver.unarchiveObject(with: temp) as! [scheduleEvent]
            eventArray = try! JSONDecoder().decode([scheduleEvent].self, from: temp)
        }

//        eventArray = NSKeyedUnarchiver.unarchiveObject(withFile: day) as! [scheduleEvent]
    }
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schedule")
        cell?.detailTextLabel?.text = eventArray[indexPath.row].timeField
       cell?.textLabel?.text = eventArray[indexPath.row].className
        return cell!
    }
   // func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
     //   let delete = deleteAction(at: indexPath)
        //let edit = editAction(at: indexPath)
       // return UISwipeActionsConfiguration(actions: [edit, delete])
    //}

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let schedule = eventArray[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            self.updateAction(schedule: schedule, indexPath: indexPath)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            self.deleteAction(schedule: schedule, indexPath: indexPath)
    }
         deleteAction.backgroundColor = .red
         editAction.backgroundColor = .blue
        return [deleteAction, editAction]
    }
    private func updateAction(schedule: scheduleEvent, indexPath: IndexPath) {
        let alert = UIAlertController(title: "Update", message: "Update a class", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default)
        { (action) in
            guard let textField = alert.textFields?.first else {
                return
            }
            if let  textToEdit = textField.text {
                if textToEdit.count == 0 {
                    return
                }
                schedule.className != textToEdit
                self.tableView?.reloadRows(at: [indexPath], with: .automatic)
            } else {
                return
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        guard let textField = alert.textFields?.first else{
            return
        }
        textField.placeholder = "Change your class name"
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
    }
     private func deleteAction(schedule: scheduleEvent, indexPath: IndexPath) {
    let alert = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.eventArray.remove(at: indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert,animated: true)
}


}
