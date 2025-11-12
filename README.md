# devhub

A Flutter application built with Clean Architecture, GetX for state management, and SharedPreferences for local persistence.
The app fetches a list of developers, toggle between light/dark themes, and supports pull-to-refresh functionality.


📁 Project Structure
<img width="699" height="357" alt="Screenshot 2025-11-12 at 4 04 49 PM" src="https://github.com/user-attachments/assets/4233bbb9-a17c-4c53-9e2d-ac2687bd5885" />



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

