import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleDailyNotification()
    }

    func scheduleDailyNotification() {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Good Morning!"
        content.body = "You slept for a day, Good Morning!"
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.second = 0 // uhmm

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            }
        }
    }
}
