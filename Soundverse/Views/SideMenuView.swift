//
//  SideMenuView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//
import SwiftUI

struct SideMenuView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var primaryText: Color {
        colorScheme == .dark ? .white : .black
    }
    
    var secondaryText: Color {
        colorScheme == .dark ? .gray : .gray.opacity(0.8)
    }
    
    @Binding var isShowing: Bool
    
    @State private var selectedMenu = "Home"
    
    let menuItems = [
        ("Home", "house.fill"),
        ("Library", "music.note.list"),
        ("AI Magic", "sparkles"),
        ("Studio", "mic.fill"),
        ("Explore", "magnifyingglass"),
        ("Rewards", "gift.fill")
    ]
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Color.black.opacity(0.35)
                .ignoresSafeArea()
                .onTapGesture {
                    
                    withAnimation {
                        isShowing = false
                    }
                }
            
            VStack(alignment: .leading, spacing: 26) {
                
                profileSection
                
                Button {
                    
                } label: {
                    
                    HStack(spacing: 14) {
                        
                        Image(systemName: "gearshape.fill")
                        
                        Text("Profile Settings")
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .foregroundColor(primaryText)
                    .padding()
                    .background(
                        colorScheme == .dark ?
                            Color.white.opacity(0.08) :
                            Color.black.opacity(0.04)
                    )
                    .cornerRadius(18)
                    .padding(.horizontal, 12)
                }
                
                menuSection
                
                Spacer()
                
                upgradeButton
            }
            .frame(width: 285)
            .padding(.vertical)
            .background(
                colorScheme == .dark ?
                    AnyShapeStyle(.ultraThinMaterial) :
                    AnyShapeStyle(Color.white.opacity(0.95))
            )
            .offset(x: isShowing ? 0 : -350)
        }
    }
}

extension SideMenuView {
    
    var profileSection: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(primaryText)
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("Roshan")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(primaryText)
                
                Text("Premium Member")
                    .foregroundColor(secondaryText)
                    .font(.caption)
            }
        }
        .padding(.horizontal, 22)
        .padding(.top, 60)
    }
    
    var menuSection: some View {
        
        VStack(spacing: 10) {
            
            ForEach(menuItems, id: \.0) { item in
                
                HStack(spacing: 16) {
                    
                    Image(systemName: item.1)
                        .frame(width: 24)
                    
                    Text(item.0)
                        .fontWeight(.medium)
                    
                    Spacer()
                }
                .foregroundColor(
                    selectedMenu == item.0
                        ? (colorScheme == .dark ? .white : .black)
                        : secondaryText
                )
                .padding()
                .background(
                    selectedMenu == item.0 ?
                    Color.white.opacity(0.12)
                    :
                    Color.clear
                )
                .cornerRadius(16)
                .padding(.horizontal, 12)
                .onTapGesture {
                    
                    selectedMenu = item.0
                }
            }
        }
    }
    
    var upgradeButton: some View {
        
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
                    colors: [
                        Color(red: 0.55, green: 0.35, blue: 0.95),
                        Color(red: 0.35, green: 0.25, blue: 0.75)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(18)
            .padding(.horizontal, 18)
        }
    }
}
