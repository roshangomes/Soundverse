//
//  ChatView.swift
//  Soundverse
//
//  Created by Steve on 07/05/26.
//


import SwiftUI

struct NotificationDetailView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                colors: [
                    .black,
                    .indigo.opacity(0.8)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                Spacer()
                
                Image(systemName: "music.note")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                
                Text("Track Generated")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Text("Your cinematic synthwave track is now ready.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Button {
                    
                } label: {
                    
                    Text("Play Track")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                colors: [.purple, .indigo],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(18)
                }
                .padding(.horizontal, 32)
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationDetailView()
}
