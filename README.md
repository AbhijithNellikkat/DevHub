# devhub

A Flutter application built with Clean Architecture, GetX for state management, and SharedPreferences for local persistence.
The app fetches a list of developers, allows users to favorite developers, toggle between light/dark themes, and supports pull-to-refresh functionality.


📁 Project Structure
lib/
├── application/
│   ├── controller/          # GetX controllers for business logic
│   └── presentation/        # UI screens and widgets
│
├── data/
│   ├── service/             # Handles API or local asset JSON fetching
│   └── shared_pref/         # SharedPreference helper classes
│
├── domain/
│   ├── core/                # App-wide constants, utilities, themes
│   ├── models/              # Entity and model definitions
│   └── repository/          # Repository implementations connecting data & domain layers
│
└── main.dart                # App entry point



🧩 Architecture Overview

This project follows Clean Architecture principles:

Layer	Responsibility
Domain	=> Business logic, entities, and repository contracts
Data	=> Handles data sources (local JSON, APIs, SharedPrefs)
Application =>	Connects data & domain layers; manages controllers (GetX)
Presentation => 	UI layer that observes GetX states


⚙️ Features

🔄 Pull-to-refresh for developer list

🌗 Dark/Light mode toggle using SharedPreferences

🧱 Clean architecture and modular design

🚀 GetX state management



🧰 Dependencies
Package	Purpose
get	State management & navigation
shared_preferences	Local key-value storage
dio or rootBundle	Fetching developer data (API or local JSON)

