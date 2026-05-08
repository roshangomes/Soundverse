//
//  NotificationManager.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//
import Foundation
import UserNotifications
import SwiftUI

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    static let shared = NotificationManager()
    
    var appState: AppState?
    
    override init() {
        super.init()
        
        UNUserNotificationCenter.current().delegate = self
    }
    
    // MARK: Permission
    
    func requestPermission() {
        
        UNUserNotificationCenter.current()
            .requestAuthorization(
                options: [.alert, .badge, .sound]
            ) { granted, error in
                
                if granted {
                    print("Permission Granted")
                } else {
                    print("Permission Denied")
                }
            }
    }
    
    // MARK: Schedule
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "New AI Track Ready 🎵"
        content.body = "Your Soundverse track has been generated."
        content.sound = .default
        
        content.userInfo = [
            "screen": "chat"
        ]
        
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current()
            .add(request)
    }
    
    // MARK: Foreground
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        
        return [.banner, .sound, .badge]
    }
    
    // MARK: Notification Tap
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse
    ) async {
        
        DispatchQueue.main.async {
            self.appState?.openChat = true
        }
    }
}
