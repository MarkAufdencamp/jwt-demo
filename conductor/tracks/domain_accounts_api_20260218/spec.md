# Specification: Domain Accounts API

## Overview
This track introduces a new `Account` resource that belongs to a `Domain`. Each `Account` represents a user or identity specifically associated with a managed domain, featuring its own credentials (username/password) and email. This extends the system's capability from managing just domains to managing the identities within those domains.

## Functional Requirements

### 1. Data Model: `Account`
- **Attributes:**
  - `username` (string): Required. Unique within the scope of the parent `Domain`.
  - `email` (string): Required.
  - `password_digest` (string): To support `has_secure_password`.
  - `domain_id` (integer/references): Foreign key to the `Domain` model.
- **Associations:**
  - `Account` belongs to `Domain`.
  - `Domain` has many `Accounts` with dependent destruction (cascade delete).

### 2. API Endpoints
- **Base Route:** `resources :domains do resources :accounts end` (or similar nested structure)
- **Actions:**
  - `GET /domains/:domain_id/accounts`: List all accounts for a specific domain.
  - `GET /domains/:domain_id/accounts/:id`: Show details of a specific account.
  - `POST /domains/:domain_id/accounts`: Create a new account for a domain.
  - `PATCH/PUT /domains/:domain_id/accounts/:id`: Update account details (username, email, password).
  - `DELETE /domains/:domain_id/accounts/:id`: Remove an account.

### 3. Security & Validation
- Use Rails' `has_secure_password` for password management.
- Ensure that users can only manage accounts for domains they own (inherited from the `Domain` access control).
- Validate presence of `username` and `email`.
- Validate uniqueness of `username` scoped to `domain_id`.

## Non-Functional Requirements
- **Consistency:** Follow existing API patterns used in `DomainsController`.
- **Test Coverage:** Minimum 80% coverage for the new model and controller.

## Acceptance Criteria
- [ ] `Account` model created with correct migrations and validations.
- [ ] `Domain` model updated with `has_many :accounts`.
- [ ] API endpoints implemented for full CRUD on accounts.
- [ ] Unauthorized users cannot access or modify accounts belonging to domains they don't own.
- [ ] Unit and integration tests passing.

## Out of Scope
- Implementation of an actual login/authentication flow *for* these domain accounts (they are "authentication ready" but not yet used for login).
- Frontend UI components.
