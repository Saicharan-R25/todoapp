# Flutter TO-DO Application

This application is a simple To-Do app built using the Flutter framework.

## Features
- Add new tasks with detailed descriptions.
- View the details of the tasks.
- Complete tasks and remove them from the list.
- Tasks are listed in a ListView for easy scrolling.
- Task list persists for the duration of the app.

## Getting Started

This project is a Flutter application.

### Prerequisites

Before you start, make sure you have Flutter and Dart set up and configured.

If you haven't done it yet, please follow the official Flutter guide at:
https://flutter.dev/docs/get-started/install

### Running the app

To run the app, simply navigate to the app's root directory in your terminal and type:

flutter run


This will start the application in a debugging mode.

You can also use Flutter in different IDEs, please see the Flutter website for more details.

### Usage

When you open the application, you'll see a dark themed app with a TO-DO list.

1. **To add a task:**
    - Click on the floating action button at the bottom of the screen.
    - You will be navigated to a new screen.
    - Enter the task title and task information.
    - Click the 'ADD' button to create the task. The task will now appear in the TO-DO list on the home screen.

2. **To view a task:**
    - Click on the task in the TO-DO list.
    - You will be navigated to a new screen that displays the task's title and information.

3. **To complete a task:**
    - Click on the "Done" button to the left of the task in the TO-DO list.
    - This will remove the task from the TO-DO list.

## Built With

- Flutter - The UI framework used.
- Dart - Programming language used.



## Disclaimer
The app does not currently support persistent storage, so tasks will be lost when the app is closed. You can add persistent storage by using any local storage packages like sqflite, shared_preferences or hive etc.