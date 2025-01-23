# News App

## Overview

News App is a Flutter-based mobile application that provides users with the latest news articles from various categories such as business, entertainment, general, health, science, sports, and technology. The app fetches news data from the News API and displays it in a user-friendly interface.

## Features

- **Latest News**: Get the most recent news articles from different categories.
- **Detailed View**: Tap on any news article to read the full details.
- **Search Functionality**: Search for news articles by keywords. (soon)
- **Responsive Design**: Optimized for both Android and iOS devices.
- **Dark Mode**: Supports dark mode for a better reading experience at night. (soon)

## Screenshots

![Home Screen](screenshots/home_screen.png)
![Details Screen](screenshots/details_screen.png)

## Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/yourusername/news_app.git
   cd news_app
   ```

2. **Install dependencies**:

   ```sh
   flutter pub get
   ```

3. **Run the app**:
   ```sh
   flutter run
   ```

## Configuration

To use the News API, you need to obtain an API key from [News API](https://newsapi.org/). Once you have the API key, replace the placeholder API keys in the [news_service.dart](http://_vscodecontentref_/0) file with your own API key.

```dart
String apiKey1 = 'YOUR_API_KEY_1';
String apiKey2 = 'YOUR_API_KEY_2';
```
