class User < ActiveRecord::Base
  has_many :shouts
  validates_uniqueness_of :email
end
