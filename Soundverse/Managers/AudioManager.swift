//
//  AudioManager.swift
//  Soundverse
//
//  Created by Steve on 08/05/26.
//
import Foundation
import AVFoundation
import SwiftUI
import Combine

final class AudioManager: NSObject, ObservableObject {
    
    static let shared = AudioManager()
    
    var player: AVAudioPlayer?
    
    var timer: Timer?
    
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var currentTime: String = "0:00"
    @Published var duration: String = "0:00"
    
    func startPlayer() {
        
        guard let url = Bundle.main.url(
            forResource: "Shape of You",
            withExtension: "mp3"
        ) else {
            print("Audio file not found")
            return
        }
        
        do {
            
            player = try AVAudioPlayer(contentsOf: url)
            
            player?.play()
            
            isPlaying = true
            
            setupDuration()
            
            startTimer()
            
        } catch {
            print("Error playing audio")
        }
    }
    
    func pausePlayer() {
        
        player?.pause()
        
        isPlaying = false
        
        timer?.invalidate()
    }
    
    func togglePlayback() {
        
        if isPlaying {
            pausePlayer()
        } else {
            
            if player != nil {
                
                player?.play()
                
                isPlaying = true
                
                startTimer()
                
            } else {
                startPlayer()
            }
        }
    }
    
    // MARK: Timer
    
    func startTimer() {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.5,
            repeats: true
        ) { _ in
            
            guard let player = self.player else { return }
            
            let current = player.currentTime
            let total = player.duration
            
            self.progress = current / total
            
            self.currentTime = self.formatTime(current)
            
            if !player.isPlaying {
                
                self.isPlaying = false
                
                self.timer?.invalidate()
            }
        }
    }
    
    // MARK: Duration
    
    func setupDuration() {
        
        guard let player = player else { return }
        
        duration = formatTime(player.duration)
    }
    
    // MARK: Time Format
    
    func formatTime(_ time: TimeInterval) -> String {
        
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        
        return String(format: "%d:%02d", minutes, seconds)
    }
}
