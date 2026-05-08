# Soundverse iOS Assignment

A modern AI-powered music experience built with SwiftUI for iOS.

---

## Overview

Soundverse is a futuristic AI music studio concept app that combines:

- AI-powered chat interactions
- Real-time music playback
- Local notification handling
- Modern iOS-native UI/UX
- Adaptive dark/light mode support

The app was built as part of an iOS internship assignment focused on notification handling, profile interaction, navigation, and smooth user experience.

---

## Features

### Home Screen
- Modern music dashboard UI
- Dynamic music player card
- Real album artworks
- Floating AI assistant button
- Trending tracks section
- Adaptive dark/light mode

### AI Chat Assistant
- Interactive AI-style messaging UI
- Typing indicator animation
- Dummy AI-generated responses
- Glassmorphism-inspired design
- Smooth message flow

### Notifications
- Local notification scheduling
- Foreground notification support
- Notification sound support
- Notification tap navigation
- Dedicated notification screen
- Opens detailed track screen on notification tap

### Music Playback
- Real MP3 playback using AVFoundation
- Play/Pause functionality
- Dynamic progress bar
- Live playback timestamps

### Navigation & UX
- Side menu navigation
- Swipe gestures for opening/closing menu
- Smooth animations and transitions
- Native iOS interaction patterns

### Branding
- Custom launch screen
- Animated splash screen
- Custom app icon
- Neon cyberpunk-inspired aesthetic

---

## Tech Stack

- SwiftUI
- AVFoundation
- UserNotifications
- Combine
- NavigationStack
- iOS 17+

---

## Architecture

The project follows a lightweight MVVM-inspired SwiftUI architecture.

### Structure

```
Views/
├── MainView
├── AIChatView
├── NotificationView
├── NotificationDetailView
├── SideMenuView
└── SplashView

Managers/
├── AudioManager
├── NotificationManager
├── HapticManager
└── AppState

Models/
├── Message
└── NotificationItem
```

### Responsibilities

- **Views** handle UI rendering and interactions
- **Managers** handle business logic and services
- **AppState** manages global navigation state
- SwiftUI state management is used throughout the app

---

## Notification Flow

```
Notification Screen
        ↓
Tap Notification Item
        ↓
Local Notification Scheduled
        ↓
Notification Appears After 5 Seconds
        ↓
Tap System Notification
        ↓
Notification Detail Screen Opens
```

---

## Screenshots

### Home Screen
- Music dashboard
- Floating AI assistant
- Music playback controls

### AI Chat
- Interactive AI conversation interface
- Typing indicator
- Prompt-based interactions

### Notifications
- Notification list UI
- Local notification handling

---

## Setup Instructions

### Requirements
- Xcode 15+
- iOS 17+
- Swift 5.9+

### Installation

1. Clone the repository
```bash
git clone https://github.com/roshangomes/Soundverse.git
```

2. Open the project in Xcode

3. Run on:
   - iOS Simulator
   - or Physical iPhone

4. Allow notification permissions when prompted

---

## Demo Highlights

- Adaptive dark/light mode
- Real-time music playback
- Dynamic progress tracking
- Interactive AI chat flow
- Foreground notification handling
- Notification routing/navigation
- Smooth side menu gestures

---

## Future Improvements

- Real AI backend integration
- Cloud music generation
- Persistent chat history
- Streaming support
- User authentication
- Playlist management

---

## Author

Built by **Roshan Gomes**.

---

## License

This project was created for educational and internship assignment purposes.
