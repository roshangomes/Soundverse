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
    
    @Environment(\.colorScheme) var colorScheme
    
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
    
    var backgroundGradient: LinearGradient {
        
        if colorScheme == .dark {
            
            return LinearGradient(
                colors: [
                    Color.black,
                    Color.indigo.opacity(0.7)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            
        } else {
            
            return LinearGradient(
                colors: [
                    Color.white,
                    Color(red: 0.95, green: 0.95, blue: 0.98)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }
    }
    
    var primaryText: Color {
        colorScheme == .dark ? .white : .black
    }
    
    var secondaryText: Color {
        colorScheme == .dark ? .gray : .gray.opacity(0.8)
    }
    
    var cardBackground: some ShapeStyle {
        colorScheme == .dark ?
            AnyShapeStyle(.ultraThinMaterial) :
            AnyShapeStyle(Color.white.opacity(0.75))
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                backgroundGradient
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(spacing: 18) {
                        
                        ForEach(notifications) { item in
                            
                            Button {
                                
                                NotificationManager.shared.scheduleNotification()
                                
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
                                            .foregroundColor(primaryText)
                                            .fontWeight(.semibold)
                                        
                                        Text(item.subtitle)
                                            .foregroundColor(secondaryText)
                                            .font(.caption)
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(cardBackground)
                                .cornerRadius(22)
                                .shadow(
                                    color: colorScheme == .dark ? .black.opacity(0.2) : .gray.opacity(0.15),
                                    radius: 10,
                                    y: 5
                                )
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
