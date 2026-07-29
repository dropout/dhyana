# Architecture Overview for Dhyana

## Application Goals
An application to help mental health practice. Provides a meditation timer and chanting audio player with lyrics as the main forms of practice. The practice is supported by insights feature that provides statistics and performance overview and a social feature that connects users who practiced at the same time.

## Architectural Goals
Balance between an enterprise-level architecture and a pragmatic, lean approach that is easier to maintain and enables future growth.

## Layers

### 1. Initial interpretation of the Clean Architecture layers.

**Entities (Domain Layer)**
- Core enterprise business rules.
- Plain data objects and enterprise-wide logic.
- Completely independent of any databases or frameworks.

**Use Cases (Application Layer)**
- Application-specific business rules.
- Orchestrates data flow to and from entities.
- Directs business actions without caring about UI or storage.

**Interface Adapters**
- Converts data between the inner layers and outer tools.
- Includes controllers, presenters, and gateways.
- Formats data for the database or web.

**Frameworks and Drivers (Infrastructure)**
- Outermost layer with external tools.
- Contains databases, web frameworks, and UI components.
- Pluggable details that change often without affecting the core.


### 2. Flutter Application specific interpretation of the Clean Architecture layers.

A pragmatic way to implement Clean Architecture for a Flutter application is by organizing your project into feature-driven modules (e.g., auth, profile, payment), rather than layer-driven global folders.

These layers below are for each module, and each module is self-contained with its own data, domain, and presentation layers.

**Data (Data Source, Repository and Service Implementations)**
- Provides data to the domain layer. (DataProvider)
- Abstracts away the details of data sources and provides a clean API for the domain layer. (Repository)

**Domain (Entities, Use Cases, Repositories and Service contracts)**
- Application-specific business rules. 
- Orchestrates data flow from data layer to view models.
- Directs business actions without caring about UI or storage.

**Presentation (View Models, State Management, UI Components)**
- Contains UI components, state management, and presentation logic.

### 3. Gains
- No adaptors or presenters are needed, as the view models can directly call the use cases and repositories.


### 4. Losses
- Entities used in data and presentation layers are creating a tighter coupling between layers


## Considerations
- **Domain and Application layers Combined**: Contains entitites, usecases, repository interface and service interfaces. 

- **Skip Use Cases for CRUD**: If a feature is just a simple "fetch data and display it" without complex business logic, let your State Management controller call the Repository or Service directly. Skip creating a UseCase class for a single line to eliminate file clutter.

- **Combine Entity and Model**: Uses freezed models for domain entities, which are shared between the data and presentation layers. This creates a tighter coupling between the layers, but reduces boilerplate code and complexity.
