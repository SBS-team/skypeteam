class Member < ActiveRecord::Base
  attr_accessible :name
  has_many :messages
  has_many :member_aliases
end
