class User < ApplicationRecord

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  validates :first_name, :last_name, :email, presence: true

end
