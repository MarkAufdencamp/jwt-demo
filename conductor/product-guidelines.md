# Product Guidelines

## Documentation & Prose
- **Technical & Precise:** Documentation and comments should prioritize accuracy, using standard industry terminology and concise, clear explanations.
- **Educational & Explanatory:** Since this is a demo, code comments should explain the *why* behind implementation choices to assist developers in learning the JWT pattern.

## API Design & Error Handling
- **Explicit & Descriptive:** API responses must use appropriate HTTP status codes. Error payloads should be descriptive enough to help client developers diagnose issues without exposing sensitive system internals.
- **Consistency:** Maintain a consistent JSON structure for both success and error responses across all endpoints.

## Security & Authentication
- **Security-First:** Prioritize secure defaults. This includes using `bcrypt` for password hashing, ensuring short-lived JWTs, and strictly validating headers and payloads.
- **Token Integrity:** Use the Rails `secret_key_base` for secure token signing and ensure tokens are properly decoded and verified for every protected request.
