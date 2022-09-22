class User < ApplicationRecord
  has_secure_password

  has_many :characters
  has_many :combats

  validates :username, presence: true

  class NotAuthorized < Exception
  end
end
