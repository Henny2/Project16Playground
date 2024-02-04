//
//  LocalNotificationsView.swift
//  Project16Playground
//
//  Created by Henrieke Baunack on 2/3/24.
//

import SwiftUI
import UserNotifications
/*
 Even though notifications might seem simple, Apple breaks them down into three parts to give it maximum flexibility:

The content is what should be shown, and can be a title, subtitle, sound, image, and so on.
The trigger determines when the notification should be shown, and can be a number of seconds from now, a date and time in the future, or a location.
The request combines the content and trigger, but also adds a unique identifier so you can edit or remove specific alerts later on. If you don’t want to edit or remove stuff, use UUID().uuidString to get a random identifier.
 */

struct LocalNotificationsView: View {
    var body: some View {
        VStack{
            Button("Request permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule notification"){
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default // user default sound
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    LocalNotificationsView()
}
