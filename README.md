# Route Planner App
A Flutter application for planning and managing travel routes, allowing users to input details like start and end locations, travel dates, distance, and duration. The app features an interactive and user-friendly form to create and submit route plans.

## Features
- **Start and End Locations:** Input text fields for specifying the starting and ending points of the route.
- **Travel Date and Time Picker:** Integrated date and time picker for scheduling trips.
- **Distance Input:** Field for specifying travel distance in kilometers with input validation.
- **Duration Picker:** Custom duration picker for estimating travel time.
- **Notifications:** Option to enable notifications (placeholder functionality).
- **Form Validation:** Real-time validation for all fields to ensure valid user inputs.

## Getting Started
Follow these instructions to set up and run the project on your local machine.

### Prerequisites
Flutter: Ensure you have Flutter installed on your system. You can download it from the Flutter website.

IDE: Install an IDE such as Android Studio or Visual Studio Code.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/daria-georgiana505/Route-Planner-App.git
   ```

2. Navigate to the project directory:
    ```bash
   cd mobile_non_native
   ```
   
3. Install dependencies:
    ```bash
   flutter pub get
   ```
   
### Running the App

1. Connect your Android or iOS device/emulator.

2. Run the app using:

    ```bash
   flutter run
   ```
   
## App Structure

The app follows an MVVM architecture for easier navigation and maintenance

### Third-Party Packages
- date_time_picker: Used for selecting dates and times.
- duration_picker_dialog_box: Custom picker for travel duration.
- flutter: Core Flutter SDK for building the app.

## Screenshots
![Home screen - light theme]()