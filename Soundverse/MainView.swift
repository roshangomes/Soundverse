//
//  MainView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//

import SwiftUI

struct MainView: View {
    
    @Binding var showSideMenu: Bool
    @Binding var showNotifications: Bool
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // Background
                LinearGradient(
                    colors: [
                        Color.black,
                        Color(red: 0.10, green: 0.05, blue: 0.18),
                        Color(red: 0.04, green: 0.04, blue: 0.08)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack(spacing: 28) {
                        
                        topBar
                        
                        greetingSection
                        
                        musicPlayerCard
                        
                        aiPromptCard
                        
                        chatPreviewSection
                        
                        recentSection
                    }
                    .padding(.bottom, 40)
                }
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
    
    // MARK: - Top Bar
    
    var topBar: some View {
        
        HStack {
            
            Button {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    showSideMenu.toggle()
                }
            } label: {
                Image(systemName: "line.3.horizontal")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(.white.opacity(0.08))
                    .clipShape(Circle())
            }
            
            Spacer()
            
            VStack(spacing: 2) {
                
                Text("Soundverse")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("AI Music Studio")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            HStack(spacing: 12) {
                
                Button {
                    showNotifications.toggle()
                } label: {
                    
                    ZStack(alignment: .topTrailing) {
                        
                        Image(systemName: "bell.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(.white.opacity(0.08))
                            .clipShape(Circle())
                        
                        Circle()
                            .fill(.purple)
                            .frame(width: 10, height: 10)
                    }
                }
                
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 42))
                    .foregroundColor(.white.opacity(0.9))
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
    
    // MARK: - Greeting
    
    var greetingSection: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Good Evening")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Create music with AI magic")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    // MARK: - Music Card
    
    var musicPlayerCard: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            HStack(spacing: 16) {
                
                RoundedRectangle(cornerRadius: 22)
                    .fill(
                        LinearGradient(
                            colors: [.purple, .pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "music.note")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    )
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Midnight Echo")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Soundverse Originals")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 20) {
                        
                        Button {} label: {
                            Image(systemName: "backward.fill")
                        }
                        
                        Button {} label: {
                            Image(systemName: "pause.fill")
                                .font(.title2)
                        }
                        
                        Button {} label: {
                            Image(systemName: "forward.fill")
                        }
                    }
                    .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            VStack(spacing: 8) {
                
                Capsule()
                    .fill(.white.opacity(0.15))
                    .frame(height: 4)
                    .overlay(alignment: .leading) {
                        
                        Capsule()
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .pink],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: 140, height: 4)
                    }
                
                HStack {
                    
                    Text("1:24")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("3:45")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(22)
        .background(.white.opacity(0.07))
        .overlay(
            RoundedRectangle(cornerRadius: 28)
                .stroke(.white.opacity(0.08))
        )
        .cornerRadius(28)
        .padding(.horizontal)
    }
    
    // MARK: - AI Prompt Card
    
    var aiPromptCard: some View {
        
        VStack(alignment: .leading, spacing: 14) {
            
            Text("Ask Soundverse AI")
                .font(.headline)
                .foregroundColor(.white)
            
            HStack {
                
                Text("Generate a lo-fi beat for studying...")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "arrow.up.circle.fill")
                    .font(.title2)
                    .foregroundColor(.purple)
            }
            .padding()
            .background(.white.opacity(0.06))
            .cornerRadius(18)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Chat Preview
    
    var chatPreviewSection: some View {
        
        VStack(spacing: 16) {
            
            HStack {
                
                Spacer()
                
                Text("Create a cinematic synth soundtrack")
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [.purple, .pink],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .foregroundColor(.white)
                    .cornerRadius(18)
            }
            
            HStack {
                
                Text("Done. Generating your track now.")
                    .padding()
                    .background(.white.opacity(0.08))
                    .foregroundColor(.white)
                    .cornerRadius(18)
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Recent Section
    
    var recentSection: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            Text("Trending Tracks")
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(0..<3) { _ in
                
                HStack(spacing: 16) {
                    
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.purple.opacity(0.7))
                        .frame(width: 60, height: 60)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Neon Dreams")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        Text("Electronic • AI Generated")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                }
                .padding()
                .background(.white.opacity(0.06))
                .cornerRadius(20)
            }
        }
        .padding(.horizontal)
    }
}
