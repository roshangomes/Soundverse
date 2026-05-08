//
//  SoundverseApp.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//

import SwiftUI

@main
struct SoundverseApp: App {
    
    @StateObject var appState = AppState()
    
    init() {
        NotificationManager.shared.requestPermission()
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            ContentView()
                .environmentObject(appState)
                .onAppear {
                    NotificationManager.shared.appState = appState
                }
        }
    }
}
