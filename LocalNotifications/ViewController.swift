//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Lucas Dahl on 12/6/18.
//  Copyright © 2018 Lucas Dahl. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Most likely this notification would be called somewhere else
        
        // Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, errors) in
            // Assume the user has accepted the notification
        }
        
        // Create a the notification content
        let content = UNMutableNotificationContent()
        // Set the properties
        content.title = "Hey I'm a notification"
        content.body = "Hey Look at me!"
        
        // Create a trigger
        let date = Date().addingTimeInterval(5)
        // Get the components
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        // Create calander trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Create the request
        let uuidString = UUID().uuidString
        // Groups everything together
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Register with the notification center
        center.add(request) { (error) in
            // Check the error handler and handle them
        }
        
    }


} // End class

