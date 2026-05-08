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
                    Color.indigo.opacity(0.8)
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
                            
                            HStack {
                                
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
                                                Color.white.opacity(0.12)
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )
                                    )
                                    .cornerRadius(20)
                                
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
                    
                    TextField(
                        "Ask Soundverse AI...",
                        text: $messageText
                    )
                    .padding()
                    .background(.white.opacity(0.1))
                    .cornerRadius(18)
                    .foregroundColor(.white)
                    
                    Button {
                        
                        sendMessage()
                        
                    } label: {
                        
                        Image(systemName: "arrow.up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                LinearGradient(
                                    colors: [.purple, .indigo],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .clipShape(Circle())
                    }
                }
                .padding()
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