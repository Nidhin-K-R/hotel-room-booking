# 🏨 Hotel Booking Management Web App

A clean and responsive **Hotel Booking Management Web App** built with **Flutter**. The application allows users to select hotel rooms, choose check-in and check-out dates, calculate the stay duration, and view the total booking amount.

This project was developed as part of the **Raintech Software Limited Developer Skills Assessment – Hotel Room Booking Coding Test**.

---

## ✨ Features

* 🏨 Display available hotel rooms
* 📅 Select check-in date
* 📅 Select check-out date
* 🛏️ Select a hotel room
* 🌙 Calculate the number of nights automatically
* 💰 Calculate the total booking price
* ✅ Validate check-in and check-out dates
* ⚠️ Display clear validation messages
* 📋 Display booking summary
* 🧩 Reusable custom widgets
* 🔄 Provider-based state management

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **Provider** – State management
* **Material Design**
* **Flutter Date Picker**
* **Flutter Web/Desktop**

No backend, database, authentication, payment gateway, or external API is required for this project.

---

## 📋 Sample Room Data

| Room Code | Room Type       | Price / Night | Max Guests |
| --------- | --------------- | ------------- | ---------- |
| R101      | Deluxe Room     | ₹3,500        | 2          |
| R102      | Deluxe Room     | ₹3,500        | 2          |
| R201      | Executive Suite | ₹5,800        | 3          |
| R202      | Executive Suite | ₹5,800        | 3          |
| R301      | Family Room     | ₹4,200        | 4          |

---

## 🧮 Booking Calculation

The application calculates the total stay and booking amount automatically.

### Number of Nights

```text
Number of Nights = Check-out Date - Check-in Date
```

### Total Amount

```text
Total Amount = Number of Nights × Price Per Night
```

### Example

```text
Check-in  : 10 September
Check-out : 13 September

Number of Nights : 3

Room Price : ₹3,500 / night

Total Amount : 3 × ₹3,500
             = ₹10,500
```

---

## ✅ Date Validation

The application validates the selected dates before calculating the booking.

### Check-in Date

The check-in date cannot be in the past.

```text
Today       : 10 September
Check-in    : 08 September ❌
```

### Check-out Date

The check-out date must be after the check-in date.

```text
Check-in    : 10 September
Check-out   : 13 September ✅
```

Invalid example:

```text
Check-in    : 10 September
Check-out   : 10 September ❌
```

The application displays a clear error message instead of failing silently.

---

## 📁 Project Structure

```text
lib/
│
├── controller/
│   └── app_provider.dart
│       └── Central state management using ChangeNotifier
│
├── core/
│   └── validators.dart
│       └── Input validation rules
│
├── models/
│   ├── customer_model.dart
│   │   └── Customer booking data model
│   │
│   └── room_model.dart
│       └── Hotel room data model
│
├── screens/
│   └── booking_screen.dart
│       └── Main booking screen
│
├── widgets/
│   ├── custom_datefield.dart
│   │   └── Reusable date selector widget
│   │
│   └── custom_textfield.dart
│       └── Reusable text field widget
│
└── main.dart
    └── Application entry point
```

---

## 🧩 Architecture

The project separates the application into different responsibilities:

### Controller

`AppProvider`

Handles application state and booking-related operations.

Main responsibilities include:

* Selecting check-in/check-out dates
* Calculating stay duration
* Calculating booking amount
* Selecting rooms
* Managing customer bookings
* Releasing rooms when a booking is removed

### Models

The project uses model classes to represent application data.

* `RoomModel`
* `CustomerModel`

### Core

Contains reusable application logic such as validation.

* `AppValidators`

### Widgets

Reusable UI components are separated from the main screen.

* `CustomDateSelector`
* `CustomTextfield`

### Screens

Contains the main application UI.

* `BookingScreen`

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

* Flutter SDK
* Dart SDK
* Google Chrome for Flutter Web
* Windows/macOS/Linux desktop environment if running as a desktop application

You can verify your Flutter installation using:

```bash
flutter doctor
```

---

## 📥 Installation

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/hotel_booking.git
```

Replace `YOUR_USERNAME` with your GitHub username.

Then move into the project directory:

```bash
cd hotel_booking
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the application

For Chrome:

```bash
flutter run -d chrome
```

For Windows:

```bash
flutter run -d windows
```

For Android/iOS:

```bash
flutter run
```

---

## 🌐 Build for Production

### Flutter Web

```bash
flutter build web
```

The production files will be generated inside:

```text
build/web/
```

### Windows

```bash
flutter build windows
```

---

## 🧪 Testing

Before submitting the project, manually test the following scenarios:

* [ ] Select a valid check-in date
* [ ] Select a valid check-out date
* [ ] Try selecting a past check-in date
* [ ] Try selecting the same check-in and check-out date
* [ ] Try selecting an earlier check-out date
* [ ] Select each available room
* [ ] Verify the number of nights
* [ ] Verify the total price
* [ ] Verify validation/error messages
* [ ] Verify the application does not crash with invalid input

---

## 📌 Project Scope

This project intentionally focuses on the core hotel booking functionality.

The following are **not included**:

* Backend
* Database
* Authentication
* Online payment
* External booking API
* Persistent booking storage

These features are outside the scope of the coding assessment.

---

## 🚀 Possible Future Improvements

If more development time were available, the following features could be added:

* Prevent selecting rooms that are already booked for the selected dates
* Guest-count filtering
* Unit tests for booking calculations
* Persistent booking storage
* Backend/API integration
* Room availability management
* Booking confirmation screen
* Improved accessibility
* More detailed room information
* Booking history

---

## 👨‍💻 Author

**Nidhin K R**

Flutter Developer

GitHub:
https://github.com/Nidhin-K-R

---

## 📄 Assessment

Developed for the **Raintech Software Limited Developer Skills Assessment – Hotel Room Booking Coding Test**.

The assessment focuses on:

* Correct date and price calculations
* Date validation
* Code structure and readability
* Error handling
* Git usage

---

## 📜 License

This project was created for a developer coding assessment and demonstration purposes.
