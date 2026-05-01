# Hayaat: First-Aid Assistant 🏥

An offline-first, bilingual (English & Urdu) emergency response application designed to provide immediate, clear, and actionable first-aid instructions during critical medical situations. 

Built with Flutter, **Hayaat** utilizes a "High-Contrast Clinical" design system specifically engineered to minimize cognitive load during high-stress emergencies.

## ✨ Key Features

- **High-End Editorial Clinical UI**: A premium, highly legible interface with tonal layering, "Emergency Red" accents, and support for seamless Light and Dark Modes.
- **Bilingual Support**: Fully localized in English and Urdu, allowing users to switch languages instantly.
- **Urdu Text-to-Speech (TTS)**: Offline audio playback of emergency steps in Urdu to guide users hands-free when they need it most.
- **Nearest Hospital Locator**: Integrated location-based routing that detects your precise coordinates and instantly maps the nearest hospitals in a built-in browser view—no external apps required.
- **Offline-First Data**: All emergency protocols are bundled locally via JSON, ensuring life-saving information is always accessible, even without an internet connection.
- **State Management**: Built efficiently using Riverpod for reliable, scalable state management.

## 🛠️ Technology Stack

- **Framework**: Flutter / Dart
- **State Management**: Riverpod (`flutter_riverpod`)
- **Location Services**: `geolocator`
- **Text-to-Speech**: `flutter_tts`
- **Mapping**: `url_launcher` (In-App Web View)
- **UI Architecture**: Custom Tonal Design System

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `^3.11.0`
- Android Studio / VS Code
- A physical Android/iOS device or emulator

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Saad-Ahsan626/First_Aid_Assistant.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd first_aid_assistant
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

### Note on Urdu TTS (Text-to-Speech)
To ensure the Urdu voice plays correctly (especially on emulators), please verify that the **Urdu (Pakistan)** voice data pack is downloaded in your device's Accessibility / Text-to-Speech settings.

## 🎨 Design System: The Clinical Sentinel
The app's UI avoids standard decorative patterns and instead relies on:
- Uncompromising clarity with large, authoritative typography.
- "Emergency Red" (`#AF101A`) used strictly for primary life-saving actions.
- Tonal layering instead of hard 1px borders to separate visual zones gracefully.
