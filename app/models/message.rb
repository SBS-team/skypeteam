class Message < ActiveRecord::Base
  attr_accessible :body, :body_type, :member_id, :workday_id
  belongs_to :workday, :counter_cache => true
  belongs_to :member
  has_many :likes
  validates :member_id, :body, :presence => true
  default_scope order("id asc")  #fix me
end
