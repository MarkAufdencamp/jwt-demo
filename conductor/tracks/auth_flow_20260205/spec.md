# Specification: User Registration and Authentication Flow

## Overview
This track focuses on completing the core authentication loop for the JWT Demo application. It includes implementing user registration, ensuring secure password handling, and providing a robust authentication endpoint that issues JSON Web Tokens.

## Requirements
- **User Registration (`POST /users`):**
  - Accept `username`, `email`, and `password`.
  - Validate presence and uniqueness of `username` and `email`.
  - Securely hash passwords using `bcrypt`.
- **User Authentication (`POST /authenticate`):**
  - Accept `username` and `password`.
  - Verify credentials.
  - Return a valid JWT upon successful authentication.
- **Protected Profile (`GET /profile`):**
  - Implement a demonstration endpoint that requires a valid Bearer token.
  - Return the authenticated user's details.

## Success Criteria
- Users can successfully register and then log in.
- The `/authenticate` endpoint returns a JWT for valid credentials.
- The `/profile` endpoint returns a 401 Unauthorized for missing or invalid tokens.
- The `/profile` endpoint returns user data for valid tokens.
