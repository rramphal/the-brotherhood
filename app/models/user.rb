class User < ActiveRecord::Base
  has_many :missions

  validates :username, presence: true
  validates :password_hash, presence: true
end
