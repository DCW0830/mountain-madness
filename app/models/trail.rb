class Trail < ActiveRecord::Base
  has_many :usertrails
  has_many :users, through: :usertrails
end
