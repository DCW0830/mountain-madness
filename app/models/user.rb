class User < ActiveRecord::Base
  has_many :usertrails
  has_many :trails, through: :usertrails
end
