# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def admin?
    # Add logic to determine if user is admin, e.g., admin: true column
    admin
  end
end