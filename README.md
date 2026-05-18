# 🎬 Movies App

A Flutter Movies App built mainly to learn and practice **Clean Architecture** in real-world Flutter applications.

Although the main focus of this project is Clean Architecture, it also includes other technologies and concepts that I already have experience with, such as API integration using Dio, state management with Bloc/Cubit, and dependency injection using GetIt.

The project focuses on building scalable, maintainable, and production-ready Flutter applications using a clean and organized architecture.
---

# 🚀 Features

- Fetch movies data from API
- Clean Architecture structure
- State Management using Bloc/Cubit
- Dependency Injection using GetIt
- Smooth animations
- Cached network images
- Beautiful UI with shimmer loading effects
- Carousel slider for movies banners

---

# 🛠️ Tech Stack

- Flutter
- Dart
- Clean Architecture
- Bloc / Cubit
- Dio
- GetIt (Service Locator)
- REST API

---

# 📂 Project Structure

```bash
lib
│
├── core
│   ├── error
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   │
│   ├── network
│   │   ├── api_constance.dart
│   │   └── error_message_model.dart
│   │
│   ├── services
│   │   └── services_locator.dart
│   │
│   ├── usecase
│   │   └── base_usecase.dart
│   │
│   └── utils
│       ├── app_constance.dart
│       ├── app_string.dart
│       ├── dummy.dart
│       └── enums.dart
│
├── movies
│   ├── data
│   │   ├── datasource
│   │   ├── models
│   │   └── repository
│   │
│   ├── domain
│   │   ├── entities
│   │   ├── repository
│   │   └── usecases
│   │
│   └── presentation
│       ├── components
│       ├── controller
│       └── screens
│
└── main.dart
```

🧠 Architecture

This project follows Clean Architecture:

Presentation Layer
UI
Bloc/Cubit
Domain Layer
Entities
Repositories
Use Cases
Data Layer
API Services
Models
Repository Implementation
