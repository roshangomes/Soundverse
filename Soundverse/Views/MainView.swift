//
//  MainView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//
import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var audioManager = AudioManager.shared
    
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
    
    @Binding var showSideMenu: Bool
    @Binding var showNotifications: Bool
    
    var body: some View {
        
        NavigationStack {
            
            ZStack(alignment: .bottomTrailing) {
                
                backgroundView
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 28) {
                        
                        topBar
                        
                        greetingSection
                        
                        musicPlayerCard
                        
                        trendingTracks
                    }
                    .padding(.bottom, 100)
                }
                
                NavigationLink {
                    
                    AIChatView()
                    
                } label: {
                    
                    ZStack {
                        
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.55, green: 0.35, blue: 0.95),
                                        Color(red: 0.35, green: 0.25, blue: 0.75)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 64, height: 64)
                            .scaleEffect(1.0)
                            .shadow(
                                color: .purple.opacity(0.4),
                                radius: 12,
                                y: 6
                            )
                        
                        Image(systemName: "wand.and.stars")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                }
                .padding(.trailing, 22)
                .padding(.bottom, 28)
            }
        }
    }
}

#Preview {
    MainView(
        showSideMenu: .constant(false),
        showNotifications: .constant(false)
    )
}

extension MainView {
    
    // MARK: Background
    
    var backgroundView: some View {
        
        Group {
            
            if colorScheme == .dark {
                
                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 0.06, green: 0.05, blue: 0.10),
                        Color(red: 0.02, green: 0.02, blue: 0.04)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
            } else {
                
                LinearGradient(
                    colors: [
                        Color.white,
                        Color(red: 0.95, green: 0.95, blue: 0.98),
                        Color(red: 0.92, green: 0.92, blue: 0.97)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: Top Bar
    
    var topBar: some View {
        
        HStack {
            
            Button {
                
                withAnimation {
                    showSideMenu.toggle()
                }
                
            } label: {
                
                Image(systemName: "line.3.horizontal")
                    .font(.headline)
                    .foregroundColor(primaryText)
                    .frame(width: 42, height: 42)
                    .background(
                        colorScheme == .dark ?
                            AnyShapeStyle(.ultraThinMaterial) :
                            AnyShapeStyle(Color.white.opacity(0.9))
                    )
                    .clipShape(Circle())
            }
            
            Spacer()
            
            VStack(spacing: 2) {
                
                Text("Soundverse")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(primaryText)
                
                Text("AI Music Studio")
                    .font(.caption2)
                    .foregroundColor(secondaryText)
            }
            
            Spacer()
            
            NavigationLink {
                
                NotificationView()
                
            } label: {
                
                ZStack(alignment: .topTrailing) {
                    
                    Image(systemName: "bell.fill")
                        .font(.headline)
                        .foregroundColor(primaryText)
                        .frame(width: 42, height: 42)
                        .background(
                            colorScheme == .dark ?
                                AnyShapeStyle(.ultraThinMaterial) :
                                AnyShapeStyle(Color.white.opacity(0.9))
                        )
                        .clipShape(Circle())
                    
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 8, height: 8)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }
    
    // MARK: Greeting
    
    var greetingSection: some View {
        
        VStack(alignment: .leading, spacing: 6) {
            
            Text("Good Evening")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(primaryText)
            
            Text("Create music with AI magic")
                .foregroundColor(secondaryText)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
    
    // MARK: Music Card
    
    var musicPlayerCard: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 16) {
                
                Image("cover0")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(
                        color: .purple.opacity(0.35),
                        radius: 10,
                        y: 5
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Shape of You")
                        .font(.headline)
                        .foregroundColor(primaryText)
                    
                    Text("Ed Sheeran")
                        .font(.subheadline)
                        .foregroundColor(secondaryText)
                    
                    HStack(spacing: 22) {
                        
                        Image(systemName: "backward.fill")
                        
                        Button {
                            
                            audioManager.togglePlayback()
                            
                        } label: {
                            
                            Image(
                                systemName: audioManager.isPlaying
                                    ? "pause.fill"
                                    : "play.fill"
                            )
                            .font(.title3)
                        }
                        
                        Image(systemName: "forward.fill")
                    }
                    .foregroundColor(primaryText)
                }
                
                Spacer()
            }
            
            VStack(spacing: 8) {
                
                Capsule()
                    .fill(.white.opacity(0.12))
                    .frame(height: 4)
                    .overlay(alignment: .leading) {
                        
                        GeometryReader { geometry in
                            
                            ZStack(alignment: .leading) {
                                
                                Capsule()
                                    .fill(.white.opacity(0.12))
                                    .frame(height: 4)
                                
                                Capsule()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color(red: 0.55, green: 0.35, blue: 0.95),
                                                Color(red: 0.35, green: 0.25, blue: 0.75)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .frame(
                                        width: geometry.size.width * audioManager.progress,
                                        height: 4
                                    )
                            }
                        }
                        .frame(height: 4)
                    }
                
                HStack {
                    
                    Text(audioManager.currentTime)
                    
                    Spacer()
                    
                    Text(audioManager.duration)
                }
                .font(.caption)
                .foregroundColor(secondaryText)
            }
        }
        .padding(22)
        .background(cardBackground)
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.05))
        )
        .cornerRadius(28)
        .shadow(
            color: colorScheme == .dark ? .black.opacity(0.2) : .gray.opacity(0.15),
            radius: 12,
            y: 6
        )
        .padding(.horizontal, 20)
    }
    
    // MARK: Trending
    
    var trendingTracks: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            Text("Trending Tracks")
                .font(.headline)
                .foregroundColor(primaryText)
            
            ForEach(0..<3) { i in
                
                HStack(spacing: 16) {
                    
                    Image("cover\(i + 1)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(
                            color: .purple.opacity(0.35),
                            radius: 10,
                            y: 5
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text(
                            [
                                "Neon Dreams",
                                "Cyber Pulse",
                                "Synth Horizon"
                            ][i]
                        )
                        .foregroundColor(primaryText)
                        .fontWeight(.semibold)
                        
                        Text(
                            [
                                "Electronic • AI Generated",
                                "Synthwave • Future Bass",
                                "Ambient • Cyberpunk"
                            ][i]
                        )
                        .foregroundColor(secondaryText)
                        .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(primaryText)
                }
                .padding()
                .background(cardBackground)
                .cornerRadius(22)
                .shadow(
                    color: colorScheme == .dark ? .black.opacity(0.2) : .gray.opacity(0.15),
                    radius: 12,
                    y: 6
                )
            }
        }
        .padding(.horizontal, 20)
    }
}
