class Domain < ApplicationRecord
  belongs_to :user

  validates :domain, presence: true, uniqueness: { scope: :tld }
  validates :tld, presence: true
end
