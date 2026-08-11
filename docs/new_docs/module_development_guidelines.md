# Module Development Guidelines

## Goals of a Module
- Encapsulate all the functionality of a specific feature in a single module.
- Provide a clear and consistent structure for developing modules in the application.
- Ensure separation of concerns between different layers of the module.
- Promote reusability and maintainability of code by defining clear interfaces and contracts between layers.

## Layers
A module has three main layers: Data, Domain, and Presentation.

### Data Layer
- **Datasources**: Data provider interfaces and implementations for remote APIs, local databases, or any other data source.
- **Repositories**: Implementations of the domain layer's repository interfaces, responsible for data access and manipulation.
- **Services**: Module-specific services that provide additional functionality or business logic.

### Domain Layer
- **Entities**: Define the core business objects and data structures.
- **Repositories**: Define abstract interfaces for data access, implemented in the data layer.
- **Services**: Define module-specific services that provide additional functionalities or encapsulate business logic.
- **Use Cases**: Implement independent, single-action business rules.

### Presentation Layer
- **View**: Contains the UI components, including views, view models.
- **ViewModel**: Implements state management using Bloc or Cubit for the UI.

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
│   │   ├── audio_service.dart           # Audio interface (No external dependencies)
│   │   └── haptics_service.dart         # Haptic feedback interface (No external dependencies)
│   └── utils/                           # Optional fast shortcuts (No interface required)
│       └── formatters.dart              # Simple local helpers (Dates, Duration, Strings, etc.))
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
│   │   │       └── login_user_use_case.dart
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
    - Repository or Service used across modules? Move its interface to core layer, leave implementation in module. (For ex.: `ProfileRepository` interface in core, `DefaultProfileRepository` implementation in profile module)
    - Entity used across modules? Move to core layer.  (For ex.: `Profile.dart`)
    - There should be no imports from one module to another module. Modules should be self-contained and independent and can only depend on core layer.
    - Except for `module_routes.dart` or any other module public api offered in the module root folder.

### Module Dependency Injection Guidelines
- Split dependency injection of the module into layers with an order from data to domain to presentation to public api
- No logic in dependency injection files
- Use factories for cubits because its often bound to a view/screen
- Keep use cases transient by using dependency injections factories for them
- Repositories and services are mostly singletons (For ex.: `HapticsService`, `ProfileRepository`) or factories if their functionality bound to specific viewmodel (For ex.: `TimerAudioService` is a factory because it is bound to the `TimerCubit` and should be disposed when the cubit is disposed)

### Data Layer Guidelines
- **Data Sources**: Implement data sources for remote APIs, local databases, or any other data provider. Use interfaces to abstract the implementation details.
- **Repositories**: Implement repositories that act as a bridge between the data sources and the domain

- **Services**: Implement module-specific services that provide additional functionality or business logic.

### Domain Layer Guidelines
- **Entities**: Define the core business objects and data structures.
- **Repositories**: Define abstract interfaces for data access, implemented in the data layer.
- **Services**: Define module-specific services that provide additional functionalities or encapsulate business logic.
- **Use Cases**: Implement independent, single-action business rules.

### View Layer Guidelines
- **View**: Implement Flutter widgets and screens that represent the user interface.
- **ViewModel**: Implement state management using Bloc or Cubit for the UI.
    - Can use domain entities for state if no additional state management is needed for the UI. (For ex.: `TimerCubit` uses `TimerState`)
    - Can use freezed models for state if additional state management is needed for the UI. (For ex.: `ProfileCubit` uses `ProfileState` which contains the `Profile` entity and additional state for the UI)
    - Can use Repositories or Services directly in the ViewModel, for simple one liners like CRUD operations.


