class Usertrail < ActiveRecord::Base
  belongs_to :trail
  belongs_to :user
end
