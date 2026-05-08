//
//  SplashView.swift
//  Soundverse
//
//  Created by Steve on 08/05/26.
//


import SwiftUI

struct SplashView: View {
    
    @State private var animate = false
    
    @State private var showMainApp = false
    
    var body: some View {
        
        if showMainApp {
            
            ContentView()
            
        } else {
            
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color(red: 0.02, green: 0.00, blue: 0.05),
                        Color(red: 0.10, green: 0.00, blue: 0.18),
                        Color(red: 0.22, green: 0.00, blue: 0.35)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.purple.opacity(0.35),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 260
                        )
                    )
                    .frame(width: 320, height: 320)
                    .blur(radius: 30)
                
                VStack(spacing: 24) {
                    
                    Image("launchLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .shadow(
                            color: Color.purple.opacity(0.8),
                            radius: 25
                        )
                        .shadow(
                            color: Color.pink.opacity(0.4),
                            radius: 40
                        )
                        .scaleEffect(animate ? 1.0 : 0.82)
                        .opacity(animate ? 1 : 0.4)
                    
                    VStack(spacing: 10) {
                        
                        Text("SOUNDVERSE")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.white, .purple.opacity(0.9)],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .tracking(2)
                        
                        Text("AI Music Studio")
                            .font(.subheadline)
                            .foregroundColor(
                                Color(red: 0.80, green: 0.75, blue: 1.0)
                                    .opacity(0.75)
                            )
                    }
                    .opacity(animate ? 1 : 0.6)
                }
            }
            .onAppear {
                
                withAnimation(
                    .easeOut(duration: 1.2)
                ) {
                    animate = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                    
                    withAnimation {
                        showMainApp = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}