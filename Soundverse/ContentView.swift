//
//  ContentView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//




// Replace your current ContentView with this improved version
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    @State private var showSideMenu = false
    @State private var showNotifications = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                MainView(
                    showSideMenu: $showSideMenu,
                    showNotifications: $showNotifications
                )
                
                if showSideMenu {
                    SideMenuView(isShowing: $showSideMenu)
                        .transition(.move(edge: .leading))
                        .zIndex(1)
                }
            }
            .navigationDestination(isPresented: $appState.openChat) {
                NotificationDetailView()
            }
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    
                    // Open Menu
                    if value.translation.width > 100 {
                        
                        withAnimation(.spring()) {
                            showSideMenu = true
                        }
                    }
                    
                    // Close Menu
                    if value.translation.width < -100 {
                        
                        withAnimation(.spring()) {
                            showSideMenu = false
                        }
                    }
                }
        )
        .animation(.spring(response: 0.35, dampingFraction: 0.82), value: showSideMenu)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}

