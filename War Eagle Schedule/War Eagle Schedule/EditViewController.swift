//
//  EditViewController.swift
//  War Eagle Schedule
//
//  Created by Brandon Martin on 4/10/18.
//  Copyright © 2018 Brandon Martin. All rights reserved.
//

import Foundation
import UIKit

struct scheduleEvent: Codable {
    let className: String
    let timeField: String
    let roomNumber: String
    let teacherField: String
    let dayField: String
    
}

class EditViewConotrolller: UIViewController {

    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var roomNumber: UITextField!
    @IBOutlet weak var teacherfield: UITextField!
    @IBOutlet weak var dayField: UITextField!
    var defaultN = UserDefaults.standard
    var eventArray = [scheduleEvent]()
    var username: String = ""
    @IBAction func savePress(_ sender: Any) {
        let event = scheduleEvent(className: className.text ?? "Class", timeField: timeField.text ?? "Time", roomNumber: roomNumber.text ?? "Room", teacherField: teacherfield.text ?? "Teacher", dayField: dayField.text ?? "Day")
        
//        if defaultN.object(forKey: event.dayField) != nil {
//            eventArray = defaultN.array(forKey: event.dayField) as? [scheduleEvent] ?? []
//        }
        if UserDefaults.standard.data(forKey: event.dayField) != nil {
            let temp = UserDefaults.standard.data(forKey: event.dayField)!
            do {
                eventArray = try JSONDecoder().decode([scheduleEvent].self, from: temp)
            } catch(_) {eventArray = []}
            
        }
        
        
        eventArray.append(event)
    
        
//        let data = NSKeyedArchiver.archivedData(withRootObject: eventArray)
        do {
            let json = try JSONEncoder().encode(eventArray)
            defaultN.set(json, forKey: event.dayField)
        } catch (_) {}
        
        
        
        
      
        
       // NSString *saveString = event.text;
       // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        if ((event.text! != nil) && (event.text! != "")) {
//        defaultN.set(event.text!, forKey: "event")
       
//    }
    performSegue(withIdentifier: "save", sender: self)
    
    
    //override func viewDidLoad() {
      //  super.viewDidLoad()
        //usernameLabel?.text = username
   //}



}
}
