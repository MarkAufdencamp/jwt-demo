# Implementation Plan: Domains API Endpoint

## Phase 1: Foundation & Data Model [checkpoint: 564e936]
- [x] Task: Create Domain Model and Migration [e2a596f]
    - [x] Generate migration for `domains` table with `domain`, `tld`, and `user_id` (indexed and unique)
    - [x] Run migration
    - [x] Define `Domain` model with validations for presence and unique combination of domain/tld
    - [x] Establish `belongs_to :user` relationship
- [x] Task: Write Model Tests [e2a596f]
    - [x] Create `test/models/domain_test.rb`
    - [x] Verify validations and associations
- [x] Task: Conductor - User Manual Verification 'Foundation & Data Model' (Protocol in workflow.md)

## Phase 2: CRUD API Implementation [checkpoint: a02ccc6]
- [x] Task: Implement DomainsController [39267f9]
    - [x] Generate `app/controllers/domains_controller.rb`
    - [x] Implement `index`, `show`, `create`, `update`, and `destroy` actions
    - [x] Scope all actions to `@current_user.domains`
    - [x] Update `config/routes.rb`
- [x] Task: Write Controller Integration Tests [39267f9]
    - [x] Create `test/controllers/domains_controller_test.rb`
    - [x] Test success and failure cases for all CRUD operations
    - [x] Test cross-user authorization (ensure users can't access others' domains)
- [x] Task: Conductor - User Manual Verification 'CRUD API Implementation' (Protocol in workflow.md)
