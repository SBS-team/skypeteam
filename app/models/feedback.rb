class Feedback < ActiveRecord::Base
  attr_accessible :body, :email, :keep
  default_scope where(:keep => false)
  scope :keep, unscoped.where(:keep => true)

  belongs_to :user
  validates :body, :presence => true
end
