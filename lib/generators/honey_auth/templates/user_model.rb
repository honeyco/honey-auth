class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false, allow_nil: true
  ROLES      = %w(user admin)
  SAFE_ROLES = %w(user)
  include HoneyAuth::Roles
end
