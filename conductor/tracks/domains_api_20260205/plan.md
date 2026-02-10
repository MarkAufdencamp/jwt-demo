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

## Phase 2: CRUD API Implementation
- [ ] Task: Implement DomainsController
    - [ ] Generate `app/controllers/domains_controller.rb`
    - [ ] Implement `index`, `show`, `create`, `update`, and `destroy` actions
    - [ ] Scope all actions to `@current_user.domains`
    - [ ] Update `config/routes.rb`
- [ ] Task: Write Controller Integration Tests
    - [ ] Create `test/controllers/domains_controller_test.rb`
    - [ ] Test success and failure cases for all CRUD operations
    - [ ] Test cross-user authorization (ensure users can't access others' domains)
- [ ] Task: Conductor - User Manual Verification 'CRUD API Implementation' (Protocol in workflow.md)
