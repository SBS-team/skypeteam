class MemberAlias < ActiveRecord::Base
  attr_accessible :member_id, :real_name
  belongs_to :member
end
