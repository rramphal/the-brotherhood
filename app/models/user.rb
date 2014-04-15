class User < ActiveRecord::Base
  has_many :missions

  validates :username, presence: true
  validates :password, presence: true
end
