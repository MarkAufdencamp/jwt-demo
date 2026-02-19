class Account < ApplicationRecord
  # has_secure_password provides built-in methods for password hashing and verification
  # using bcrypt, and adds validations for password presence and confirmation.
  has_secure_password

  belongs_to :domain

  # Validations ensure data integrity at the model level.
  # Usernames are scoped to the domain to allow multiple domains to have an 'admin' account.
  validates :username, presence: true, uniqueness: { scope: :domain_id }
  validates :email, presence: true
end
