class Feedback < ActiveRecord::Base
  attr_accessible :body, :email, :keep
  default_scope where(:keep => false)             # fix me
  scope :keep, unscoped.where(:keep => true)      # fix me

  belongs_to :user
  validates :body, :presence => true
end
