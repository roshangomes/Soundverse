//
//  ContentView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//
import SwiftUI

struct ContentView: View {
    
    @State private var showSideMenu = false
    @State private var showNotifications = false
    
    var body: some View {
        
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
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: showSideMenu)
    }
}

#Preview {
    ContentView()
}
