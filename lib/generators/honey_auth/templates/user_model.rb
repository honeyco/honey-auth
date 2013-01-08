class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name, :password, :password_confirmation
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false, allow_nil: true
  ROLES = %w(user admin)
  include HoneyAuth::Roles
end
