# Hacker News Mobile Articles App

## Description

This Flutter application displays a list of articles published on Hacker News related to "Mobile". The articles are fetched from the Hacker News API and are shown sorted by date, with the most recent articles first. The app supports pull-to-refresh to update results and handles offline scenarios by showing previously fetched articles.

## Requirements

- Flutter SDK

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ValentinLana/articles_list.git
2. Navigate to the project directory::
   ```bash
   cd articles_list
3. Install the dependencies:
   ```bash
   flutter pub get


## Running the App

To run the application on a device or emulator, use the following command:
```bash
flutter run
```

## Functionality

- **Article List**: The main screen displays a list of articles sorted by creation date, showing the title, author, and creation date for each article.
- **Refresh Results**: Use the pull-to-refresh feature to update the results.
- **Offline Mode**: When there is no internet connection, the app displays the list of previously fetched articles.

## Decisions

- **Architecture**: A clean architecture is used with separated layers to ensure maintainability and scalability.
- **State and Data Management**: The BLoC pattern is used for state management and data flow.
- **Error Handling**: A generic error class is implemented to handle possible API request failures.

## Third-Party Libraries

- [Dio](https://pub.dev/packages/dio) for HTTP request management.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management with the BLoC pattern.
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) to check internet connectivity status.
- [get_it](https://pub.dev/packages/get_it) for dependency injection.
- [equatable](https://pub.dev/packages/equatable) for value equality comparisons.
- [intl](https://pub.dev/packages/intl) for internationalization and date formatting.
