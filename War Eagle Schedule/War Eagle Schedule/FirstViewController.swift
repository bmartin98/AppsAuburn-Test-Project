//
//  FirstViewController.swift
//  War Eagle Schedule
//
//  Created by Brandon Martin on 4/3/18.
//  Copyright © 2018 Brandon Martin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mondayI: UIImageView!
    @IBOutlet weak var mondayL: UILabel!
    
    let weekdays = ["Monday", "Tuesday", "Wendesday", "Thursday", "Friday"]
    
    let myImage: [UIImage] = [#imageLiteral(resourceName: "Mondau.gif"),#imageLiteral(resourceName: "Tuesday.jpg"),#imageLiteral(resourceName: "Wenesday.png"),#imageLiteral(resourceName: "Thursday.jpg"),#imageLiteral(resourceName: "Friday.jpg")]
    
    var myIndex = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "monday")
        
        cell?.detailTextLabel?.text = weekdays[indexPath.row]
        cell?.textLabel?.text =  weekdays[indexPath.row]
        cell?.imageView?.image = myImage[indexPath.row]
        return cell!
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "Eagle", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

