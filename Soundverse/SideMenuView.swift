//
//  SideMenuView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isShowing: Bool
    @State private var selectedMenu = "Home"
    
    let menuItems = [
        ("Create", "plus.circle.fill"),
        ("Home", "house.fill"),
        ("AI Magic", "wand.and.stars"),
        ("Library", "music.note.list"),
        ("Studio", "mic.fill"),
        ("Explore", "magnifyingglass"),
        ("Rewards", "gift.fill")
    ]
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            if isShowing {
                
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            isShowing = false
                        }
                    }
            }
            
            VStack(alignment: .leading, spacing: 24) {
                
                // Profile
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 64))
                        .foregroundColor(.purple)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Roshan")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("Premium Member")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                }
                .padding(.top, 70)
                .padding(.horizontal, 24)
                
                // Menu Items
                
                VStack(spacing: 12) {
                    
                    ForEach(menuItems, id: \.0) { item in
                        
                        MenuRow(
                            title: item.0,
                            icon: item.1,
                            isSelected: selectedMenu == item.0
                        )
                        .onTapGesture {
                            selectedMenu = item.0
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        Image(systemName: "sparkles")
                        
                        Text("Upgrade Plan")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.purple, .pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(18)
                }
                .padding(24)
            }
            .frame(width: 300)
            .background(
                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 0.08, green: 0.05, blue: 0.12)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .offset(x: isShowing ? 0 : -350)
            .animation(
                .spring(response: 0.35, dampingFraction: 0.8),
                value: isShowing
            )
        }
    }
}

struct MenuRow: View {
    
    let title: String
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Image(systemName: icon)
                .font(.title3)
                .frame(width: 24)
            
            Text(title)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .foregroundColor(isSelected ? .white : .gray)
        .padding()
        .background(
            isSelected ?
            LinearGradient(
                colors: [.purple.opacity(0.8), .pink.opacity(0.7)],
                startPoint: .leading,
                endPoint: .trailing
            )
            :
            LinearGradient(
                colors: [.clear],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(18)
        .padding(.horizontal, 12)
    }
}
