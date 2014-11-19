class Trail < ActiveRecord::Base
  has_many :usertrails
  has_many :users, through: :usertrails

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
end
