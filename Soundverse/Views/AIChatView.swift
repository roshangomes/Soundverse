//
//  Message.swift
//  Soundverse
//
//  Created by Steve on 08/05/26.
//


import SwiftUI

struct Message: Identifiable {
    
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct AIChatView: View {
    
    @State private var messageText = ""
    
    @State private var messages: [Message] = [
        Message(
            text: "Hey! I’m Soundverse AI 🎵",
            isUser: false
        )
    ]
    
    @State private var isTyping = false
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                colors: [
                    Color.black,
                    Color(red: 0.05, green: 0.04, blue: 0.12),
                    Color(red: 0.10, green: 0.08, blue: 0.25)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                
                // Messages
                
                ScrollView {
                    
                    VStack(spacing: 16) {
                        
                        ForEach(messages) { message in
                            
                            HStack(alignment: .bottom, spacing: 10) {
                                
                                if !message.isUser {
                                    
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [.purple, .pink],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .frame(width: 34, height: 34)
                                        .overlay(
                                            Image(systemName: "sparkles")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                        )
                                }
                                
                                if message.isUser {
                                    Spacer()
                                }
                                
                                Text(message.text)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(
                                        message.isUser
                                        ?
                                        LinearGradient(
                                            colors: [.purple, .indigo],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                        :
                                        LinearGradient(
                                            colors: [
                                                Color.white.opacity(0.08),
                                                Color.white.opacity(0.04)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .cornerRadius(24)
                                
                                if !message.isUser {
                                    Spacer()
                                }
                            }
                        }
                        
                        // Typing Indicator
                        
                        if isTyping {
                            
                            HStack {
                                
                                HStack(spacing: 6) {
                                    
                                    Circle()
                                        .frame(width: 8, height: 8)
                                    
                                    Circle()
                                        .frame(width: 8, height: 8)
                                    
                                    Circle()
                                        .frame(width: 8, height: 8)
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(.white.opacity(0.1))
                                .cornerRadius(18)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding()
                }
                
                // Input Bar
                
                HStack(spacing: 14) {
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "waveform")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .frame(width: 42, height: 42)
                            .background(.white.opacity(0.08))
                            .clipShape(Circle())
                    }
                    
                    TextField(
                        "What would you like to create?",
                        text: $messageText
                    )
                    .foregroundColor(.white)
                    
                    Button {
                        
                        sendMessage()
                        
                    } label: {
                        
                        Image(systemName: "paperplane.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 48, height: 48)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.65, green: 0.35, blue: 1.0),
                                        Color(red: 0.35, green: 0.25, blue: 0.9)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(Circle())
                            .shadow(
                                color: .purple.opacity(0.4),
                                radius: 8,
                                y: 4
                            )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.08),
                            Color.white.opacity(0.04)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 28)
                        .stroke(.white.opacity(0.06))
                )
                .cornerRadius(28)
                .padding(.horizontal)
                .padding(.bottom, 12)
            }
        }
        .navigationTitle("Soundverse AI")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: Send Message
    
    func sendMessage() {
        
        guard !messageText.isEmpty else { return }
        
        let userMessage = Message(
            text: messageText,
            isUser: true
        )
        
        messages.append(userMessage)
        
        messageText = ""
        
        isTyping = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            isTyping = false
            
            let replies = [
                "Generating your AI soundtrack 🎵",
                "Done! Your beat is almost ready.",
                "Creating cinematic audio layers...",
                "Mixing vocals and synth now.",
                "Your track sounds amazing already 🔥"
            ]
            
            let reply = Message(
                text: replies.randomElement() ?? "Done!",
                isUser: false
            )
            
            messages.append(reply)
        }
    }
}

#Preview {
    NavigationStack {
        AIChatView()
    }
}
