class Message < ActiveRecord::Base
  attr_accessible :body, :body_type, :member_id
end
