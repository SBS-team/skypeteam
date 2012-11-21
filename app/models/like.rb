class Like < ActiveRecord::Base
  attr_accessible :message_id, :user_id
  belongs_to :user
  belongs_to :message, :counter_cache => true
  validates :user_id, :uniqueness => {:scope => :message_id}
end
