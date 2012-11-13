class Workday < ActiveRecord::Base
  attr_accessible :skype_date, :original_text_id
  has_many :messages, :dependent => :destroy
  belongs_to :original_text

  validates :skype_date, :original_text_id, :presence => true, :uniqueness => true

  def name
    skype_date.to_s(:db)
  end
end
