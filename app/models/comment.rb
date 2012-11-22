class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :workday_id
  belongs_to :user
  belongs_to :workday, :counter_cache => true
  validates :user_id, :workday_id, :body, :presence => true
  validates :body, :length => {:maximum => 300, :minimum => 1}
  default_scope order("created_at desc")
end
