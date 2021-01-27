class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  has_secure_password
end
