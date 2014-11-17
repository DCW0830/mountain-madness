class Usertrail < ActiveRecord::Base
  belongs_to :trails
  belongs_to :users
end
