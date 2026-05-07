//
//  NotificationItem.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//


import SwiftUI

struct NotificationItem: Identifiable {
    
    let id = UUID()
    let title: String
    let subtitle: String
}

struct NotificationView: View {
    
    let notifications = [
        NotificationItem(
            title: "Track Generated",
            subtitle: "Your cinematic soundtrack is ready"
        ),
        NotificationItem(
            title: "New Message",
            subtitle: "AI Assistant replied to you"
        ),
        NotificationItem(
            title: "Playlist Updated",
            subtitle: "Your lo-fi playlist was refreshed"
        )
    ]
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(spacing: 18) {
                        
                        ForEach(notifications) { item in
                            
                            Button {
                                
//                                NotificationManager.shared.scheduleNotification()
                                
                            } label: {
                                
                                HStack(spacing: 16) {
                                    
                                    Circle()
                                        .fill(.purple)
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: "bell.fill")
                                                .foregroundColor(.white)
                                        )
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .fontWeight(.semibold)
                                        
                                        Text(item.subtitle)
                                            .foregroundColor(.gray)
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(22)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationView()
}
