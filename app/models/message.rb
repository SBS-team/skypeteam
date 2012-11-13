class Message < ActiveRecord::Base
  attr_accessible :body, :body_type, :member_id
  belongs_to :workday
  belongs_to :member
end
