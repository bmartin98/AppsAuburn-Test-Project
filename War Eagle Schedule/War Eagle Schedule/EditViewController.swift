//
//  EditViewController.swift
//  War Eagle Schedule
//
//  Created by Brandon Martin on 4/10/18.
//  Copyright © 2018 Brandon Martin. All rights reserved.
//

import Foundation
import UIKit

struct scheduleEvent {
    let className: String
    let roomNumber: String
    let teacherField: String
    let dayField: String
}

class EditViewConotrolller: UIViewController {

    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var roomNumber: UITextField!
    @IBOutlet weak var teacherfield: UITextField!
    @IBOutlet weak var dayField: UITextField!
    var defaultN = UserDefaults.standard
    var eventArray = [scheduleEvent]()
    
    @IBAction func savePress(_ sender: Any) {
        let event = scheduleEvent(className: className.text ?? "Class", roomNumber: roomNumber.text ?? "Room", teacherField: teacherfield.text ?? "Teacher", dayField: dayField.text ?? "Day")
        
        if defaultN.object(forKey: "eventArray") != nil {
            eventArray = defaultN.array(forKey: "eventArray") as? [scheduleEvent] ?? []
        }
        
        eventArray.append(event)
        defaultN.set(eventArray, forKey: "eventArray")
        
       // NSString *saveString = event.text;
       // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        if ((event.text! != nil) && (event.text! != "")) {
//        defaultN.set(event.text!, forKey: "event")
       
//    }
    
    
    
   // override func viewDidLoad() {
    //super.viewDidLoad()
   // }
//}


}
}
