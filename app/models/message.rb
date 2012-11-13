class Message < ActiveRecord::Base
  attr_accessible :body, :body_type, :member_id
  belongs_to :workday, :counter_cache => true
  belongs_to :member
  validates :member_id, :body, :presence => true
end
