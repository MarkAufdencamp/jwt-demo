# Specification: Domains API Endpoint

## Overview
This track implements a RESTful API endpoint for managing domain names within the JWT-authenticated environment. It allows users to perform CRUD operations on domains they own.

## Functional Requirements
- **List Domains (`GET /domains`):** Return all domains belonging to the authenticated user.
- **Show Domain (`GET /domains/:id`):** Return details of a specific domain, ensuring ownership by the authenticated user.
- **Create Domain (`POST /domains`):** Allow authenticated users to add a new domain.
- **Update Domain (`PATCH/PUT /domains/:id`):** Allow authenticated users to modify domain attributes.
- **Delete Domain (`DELETE /domains/:id`):** Allow authenticated users to remove a domain.

## Data Model: Domain
- `domain` (String, required - e.g., "google")
- `tld` (String, required - e.g., "com")
- `user_id` (Integer/Foreign Key, required, association with User)

## Acceptance Criteria
- All endpoints must require a valid JWT (inherited from `ApplicationController`).
- Users MUST NOT be able to access, modify, or delete domains belonging to other users.
- Validation: The combination of `domain` + `tld` must be unique across the entire system.
- API responses should follow the project's consistent JSON structure and status codes.

## Out of Scope
- Domain verification logic (DNS checks).
- DNS record management.
- Domain registrar integrations.
