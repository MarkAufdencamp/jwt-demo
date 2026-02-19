# Implementation Plan: Domain Accounts API

This plan outlines the steps to implement the `Account` model and its corresponding nested API endpoints, following the project's TDD workflow.

## Phase 1: Data Model and Associations
Implement the `Account` model with validations, security features, and its relationship to the `Domain` model.

- [~] Task: Create `Account` migration and model
    - [ ] Generate migration: `rails generate model Account domain:references username:string email:string password_digest:string`
    - [ ] Update migration to add unique index on `[:domain_id, :username]`
    - [ ] Run migration: `bin/rails db:migrate`
- [ ] Task: Implement `Account` model logic (TDD)
    - [ ] Write failing unit tests for `Account` (validations: presence of username/email, uniqueness of username scoped to domain; `has_secure_password`)
    - [ ] Implement `has_secure_password` in `app/models/account.rb`
    - [ ] Add validations to `app/models/account.rb`
    - [ ] Verify tests pass
- [ ] Task: Update `Domain` model associations
    - [ ] Write failing unit test in `domain_test.rb` for `has_many :accounts` and dependent destruction
    - [ ] Add `has_many :accounts, dependent: :destroy` to `app/models/domain.rb`
    - [ ] Verify tests pass
- [ ] Task: Conductor - User Manual Verification 'Phase 1: Data Model and Associations' (Protocol in workflow.md)

## Phase 2: API Controller and Routing
Implement the nested RESTful API for managing accounts within a domain.

- [ ] Task: Configure Routes
    - [ ] Update `config/routes.rb` to nest `resources :accounts` within `resources :domains`
- [ ] Task: Implement `AccountsController` (TDD)
    - [ ] Create `test/controllers/accounts_controller_test.rb` with failing tests for CRUD actions
    - [ ] Implement `index` action: List accounts for the specified domain
    - [ ] Implement `show` action: Show details of a specific account
    - [ ] Implement `create` action: Create account associated with the domain
    - [ ] Implement `update` action: Update account details
    - [ ] Implement `destroy` action: Delete account
    - [ ] Verify all controller tests pass
- [ ] Task: Implement Ownership Security (TDD)
    - [ ] Write failing tests to ensure a user cannot access/modify accounts of a domain they don't own
    - [ ] Implement `set_domain` before_action in `AccountsController` that finds the domain via `current_user.domains.find(params[:domain_id])`
    - [ ] Verify security tests pass
- [ ] Task: Conductor - User Manual Verification 'Phase 2: API Controller and Routing' (Protocol in workflow.md)

## Phase 3: Final Verification and Cleanup
- [ ] Task: Documentation and Style
    - [ ] Ensure all new methods are documented
    - [ ] Run RuboCop and fix any linting issues: `bin/rubocop`
- [ ] Task: Final Coverage Check
    - [ ] Run full test suite and verify coverage > 80% for new code
- [ ] Task: Conductor - User Manual Verification 'Phase 3: Final Verification and Cleanup' (Protocol in workflow.md)
