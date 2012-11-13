class Workday < ActiveRecord::Base
  attr_accessible :skype_date, :timestamp
  has_many :messages
end
