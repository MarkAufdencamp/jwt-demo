# Tech Stack

## Backend
- **Language:** Ruby (specified in `.ruby-version`)
- **Framework:** Ruby on Rails 8.0.4 (API mode)
- **Authentication:**
  - `jwt` gem for token encoding and decoding.
  - `bcrypt` for secure password hashing via `has_secure_password`.
- **Server:** Puma (default Rails application server)

## Data & Infrastructure
- **Database:** MySQL (using the `mysql2` gem)
- **Caching & Queuing (The "Solid" Stack):**
  - **Solid Cache:** Database-backed cache store.
  - **Solid Queue:** Database-backed job queue.
  - **Solid Cable:** Database-backed Action Cable adapter.

## DevOps & Tooling
- **Deployment:** [Kamal](https://kamal-deploy.org) for zero-downtime deployments.
- **Containerization:** Docker (provided `Dockerfile` and `.dockerignore`).
- **Reverse Proxy:** [Thruster](https://github.com/basecamp/thruster/) for HTTP asset caching and compression.
- **Linting:** RuboCop (using `rubocop-rails-omakase`).
