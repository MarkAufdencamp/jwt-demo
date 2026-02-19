# Project Context: JWT Demo

## Project Overview
This is a Ruby on Rails API application designed to demonstrate JSON Web Token (JWT) authentication. It provides endpoints for user authentication (login/registration), profile management, and domain resource management, utilizing a custom JWT implementation alongside Rails' built-in secure password features.

## Tech Stack
*   **Framework:** Ruby on Rails 8.0.4
*   **Language:** Ruby
*   **Database:** MySQL (`mysql2` gem)
*   **Authentication:**
    *   **JWT:** Custom implementation using the `jwt` gem (see `app/lib/json_web_token.rb`).
    *   **Password Hashing:** `bcrypt` (via `has_secure_password`).
*   **Deployment:** Docker & Kamal
*   **Background Jobs/Caching:** Solid Queue, Solid Cache, Solid Cable

## Key Components

### Authentication & Users
*   **`app/lib/json_web_token.rb`**: A utility class responsible for encoding and decoding JWTs. It uses the Rails `secret_key_base` for signing.
*   **`app/controllers/authentication_controller.rb`**: Handles the `/authenticate` endpoint (login).
*   **`app/controllers/users_controller.rb`**: Handles user registration (`POST /users`).
*   **`app/controllers/profile_controller.rb`**: Handles retrieving the authenticated user's profile (`GET /profile`).
*   **`app/models/user.rb`**: The User model with `has_secure_password`. Validates `username` and `email`. Has many `domains`.

### Domains Resource
*   **`app/controllers/domains_controller.rb`**: Standard CRUD controller for managing domains associated with the current user.
*   **`app/models/domain.rb`**: Represents a domain (`domain`, `tld`) belonging to a user. Validates presence and uniqueness of domain+tld pair.

### Routes (`config/routes.rb`)
*   `POST /authenticate` -> `AuthenticationController#authenticate`
*   `POST /users` -> `UsersController#create`
*   `GET /profile` -> `ProfileController#show`
*   `resources :domains`: Full CRUD for domains (`index`, `show`, `create`, `update`, `destroy`).
*   `GET /up`: Health check endpoint.

## Development Setup

### Prerequisites
*   Ruby (see `.ruby-version`)
*   MySQL Server

### Installation
1.  **Install Dependencies:**
    ```bash
    bundle install
    ```
2.  **Database Setup:**
    ```bash
    bin/rails db:create
    bin/rails db:migrate
    ```

### Running the Application
Start the Rails server:
```bash
bin/rails server
```
The server will default to `http://localhost:3000`.

### Testing
Run the test suite:
```bash
bin/rails test
```

## Docker & Deployment
The project includes a `Dockerfile` and `.kamal` configuration for containerized deployment.
*   **Docker:** Used for building the application image.
*   **Kamal:** Used for deploying the application to servers.

## Conventions
*   **API-Only:** The application is structured primarily as an API.
*   **Solid Stack:** Uses the "Solid" family of gems for database-backed caching, queuing, and websockets.