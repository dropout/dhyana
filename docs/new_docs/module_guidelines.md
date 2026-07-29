# Module Guidelines



## Folder Structure Overview

```text
lib/
├── core/                                # Global System Utilities & Core Shared Layer
│   ├── audio/                           # Audio Handlers & Audio Session Configuration
│   │   ├── app_audio_handler.dart       # Global audio handler for the app
│   │   └── so_timer_audio_handler.dart  # Audio handler for timer feature
│   ├── infrastructure/                  # External framework implementations
│   │   ├── audio_service_impl.dart      # Real audio player plugin integration
│   │   └── haptics_service_impl.dart    # System haptics plugin implementation
│   ├── services/                        # Abstract definitions for global helpers
│   │   ├── audio_service.dart           # Pure Dart audio interface
│   │   └── haptics_service.dart         # Pure Dart haptic feedback interface
│   └── utils/                           # Optional fast shortcuts (No interface required)
│       └── formatters.dart              # Simple local helpers (Dates, currency)
│
├── modules/                             # Domain Feature Modules
│   ├── authentication/                  # Sample Feature 1: Auth
|   |   |
│   │   ├── data/                        # Data & Infrastructure Layer
│   │   │   ├── datasource/              # API clients (Dio/Http) or local database storage
│   │   │   │   └── auth_remote_api.dart
│   │   │   ├── repository/              # Implements the domain contract
│   │   │   |   └── auth_repository_impl.dart
│   │   │   └── service/                 # Module-specific abstract service interfaces
│   │   │       └── biometric_auth_service.dart
│   │   │
│   │   ├── domain/                      # Core Logic Layer
│   │   │   ├── entities/                # Freezed data classes
│   │   │   │   └── user.dart
│   │   │   ├── repositories/            # Abstract boundaries for the data layer
│   │   │   │   └── auth_repository.dart
│   │   │   ├── service/                 # Module-specific abstract service interfaces
│   │   │   |   └── biometric_auth_service.dart
│   │   │   └── usecases/                # Independent, single-action business rules
│   │   │       └── login_user.dart
│   │   │
│   │   ├── presentation/                # UI Layer (Flutter Framework)
│   │   |    ├── view/                   # Widgets & Screens
|   |   |    |   ├── login_form.dart
|   |   |    |   └── login_screen.dart    
│   │   |    └── viewmodel/              # Bloc/Cubit State Management
|   |   |        ├── auth_cubit.dart      
|   |   |        └── auth_state.dart      
|   |   |
|   |   ├── auth_routes.dart             # Routes defined by the module
|   |   └── auth_di.dart                 # Dependency injection for the module
│   |
├   └── checkout/                        # Sample Feature 2: Checkout (Uses Global Services)
│       ├── data/
│       │   ├── datasources/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │       └── complete_checkout.dart # Use case that imports Core AudioService
│       │
│       └── presentation/
│
└── main_development.dart                # App entry point & dependency initialization
```

## Module Development Guidelines

### Generic Guidelines

- **Modules depend on core layer**: Modules can depend on the core layer for shared services, utilities, and interfaces. 
- **No cross module dependencies**: Move the target dependency to the core layer or to an orchestration module if appropriate.
    - Repository or Service used across modules? Move its interface to core layer, leave implementation in module. 
    - Entity used across modules? Move to core layer. 
    - There should be no imports from one module to another module. Modules should be self-contained and independent and can only depend on core layer.
    - Except for `module_routes.dart` or any other module public api offered in the module root folder.

### Module Dependency Injection Guidelines
- Use factories for cubits
- Use factories for use cases
- Repositoires and services are mostly singletons, 

### Data Layer Guidelines
### Data Layer Guidelines
### Data Layer Guidelines


