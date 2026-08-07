


## Considerations
- **Domain and Application layers Combined**: Contains entitites, usecases, repository interface and service interfaces. 

- **Skip Use Cases for CRUD**: If a feature is just a simple "fetch data and display it" without complex business logic, let your State Management controller call the Repository or Service directly. Skip creating a UseCase class for a single line to eliminate file clutter.

- **Combine Entity and Model**: Uses freezed models for domain entities, which are shared between the data and presentation layers. This creates a tighter coupling between the layers, but reduces boilerplate code and complexity.
