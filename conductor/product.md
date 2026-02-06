# Initial Concept
This is a Ruby on Rails API application designed to demonstrate JSON Web Token (JWT) authentication. It provides endpoints for user authentication and token generation, utilizing a custom JWT implementation alongside Rails' built-in secure password features.

# Product Definition

## Target Users
- Developers looking for a reference implementation of Rails JWT authentication.
- Security auditors evaluating JWT best practices in Rails.
- Frontend developers needing a backend API to test authentication flows.

## Primary Goals
- Showcase how to secure Rails controller actions using token-based authentication.
- Provide a clear, production-ready example of JWT integration within a modern Rails environment.

## Key Features
- **User Registration:** Endpoint (`POST /users`) to create new user accounts.
- **User Authentication:** Secure login (`POST /authenticate`) that verifies credentials and issues a JWT.
- **Password Management:** Secure password hashing using `bcrypt` and support for password reset flows.
- **Protected Resources:** Demonstration of securing API endpoints (e.g., Profile/Dashboard) requiring a valid Bearer token.
