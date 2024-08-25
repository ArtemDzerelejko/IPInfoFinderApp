# IPInfoFinder

**IP Info Finder** is an iOS application developed using SwiftUI for iPhones running iOS 15 and above. The app allows users to search for information based on IP addresses and view the results on an interactive map.

## Features

- Search for IP information using a user-friendly interface
- Automatic IP detection for the user's device
- Display of detailed IP information including country, region, and location
- Interactive map view for visualizing IP locations
- Error handling and user feedback
- Clean and intuitive user interface optimized for iPhone devices in portrait mode

## Architecture

The app is built using the **MVVM (Model-View-ViewModel)** architecture pattern, providing a clean separation of concerns:

- **Model**: Represents the data and business logic of the app.
- **View**: Defines the structure, layout, and appearance of the user interface.
- **ViewModel**: Acts as a mediator between the Model and View, handling the presentation logic.

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/IPInfoFinderApp.git
2. Open `IPInfoFinder.xcodeproj` in Xcode.
3. Build and run the project on your iPhone or iOS Simulator.

## Usage

1. Launch the app on your iPhone.
2. Enter an IP address in the search field or use the "Find Me" button to detect your current IP.
3. Tap "Get Info" to retrieve information about the entered IP.
4. View the detailed information and tap on the location to see it on the map.
5. Use the "Reset" button to clear all data and start a new search.

## API Integration

The app uses the following APIs:

- [ipinfo.io](https://ipinfo.io/) for retrieving IP information.
- [api.ipify.org](https://www.ipify.org/) for detecting the user's IP address.

Ensure you have a stable internet connection to use these features.

## Technical Details

- Developed using SwiftUI.
- Implements MVVM architecture for better code organization and testability.
- Uses `URLSession` with `async/await` for network requests.
- Custom UI components for enhanced user experience.
- Implements proper error handling and user feedback mechanisms.
