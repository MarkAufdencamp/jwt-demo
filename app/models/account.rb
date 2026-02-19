class Account < ApplicationRecord
  has_secure_password

  belongs_to :domain

  validates :username, presence: true, uniqueness: { scope: :domain_id }
  validates :email, presence: true
end
