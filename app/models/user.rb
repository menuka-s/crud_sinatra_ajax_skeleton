require 'bcrypt'

class User < ActiveRecord::Base
  has_many :posts


  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates :email, format: { with: /\w+@\w+\.[a-zA-Z]{2,8}/ }

  def authenticate(password_attempt)
    if BCrypt::Password.new(hashed_password) == password_attempt
      return true
    end
  end

  def password
   @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
   @password = BCrypt::Password.create(new_password)
   self.hashed_password = @password
  end

end
