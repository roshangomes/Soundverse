////
////  NotificationManager.swift
////  Soundverse
////
////  Created by Steve on 07/05/26.
////
//
//
//import Foundation
//import UserNotifications
//
//class NotificationManager: NSObject, ObservableObject {
//    
//    static let shared = NotificationManager()
//    
//    func requestPermission() {
//        
//        UNUserNotificationCenter.current()
//            .requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
//                
//                if granted {
//                    print("Notification Permission Granted")
//                } else {
//                    print("Permission Denied")
//                }
//            }
//    }
//    
//    func scheduleNotification() {
//        
//        let content = UNMutableNotificationContent()
//        
//        content.title = "New AI Track Ready 🎵"
//        content.body = "Your Soundverse track has been generated."
//        content.sound = .default
//        
//        // opens app later
//        content.userInfo = [
//            "screen": "chat"
//        ]
//        
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 5,
//            repeats: false
//        )
//        
//        let request = UNNotificationRequest(
//            identifier: UUID().uuidString,
//            content: content,
//            trigger: trigger
//        )
//        
//        UNUserNotificationCenter.current()
//            .add(request)
//    }
//}
