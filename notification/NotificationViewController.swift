//
//  NotificationViewController.swift
//  notification
//
//  Created by Jose Cleilton Feitosa on 08/04/21.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {
    
    @IBOutlet var label: UILabel?
    var count = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
        
    }
    
    func didReceive(_ notification: UNNotification) {
        self.label?.text = "Vai começar..."
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] (Timer) in
            if self?.count ?? 0 > 0 {
                self?.label?.text = ("\(self?.count ?? 0) seconds")
                self?.count -= 1
            } else {
                self?.label?.text = ("Foi . . . ")
                Timer.invalidate()
            }
        }
    }
}
