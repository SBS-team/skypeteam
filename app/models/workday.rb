class Workday < ActiveRecord::Base
  attr_accessible :skype_date, :original_text_id
  has_many :messages, :dependent => :destroy
  belongs_to :original_text

  validates :skype_date, :original_text_id, :presence => true, :uniqueness => true
  default_scope order("skype_date asc")

  def name
    skype_date.to_s(:db)
  end

  def next_date
    Workday.where("skype_date > ?", skype_date).pluck(:skype_date).first
  end

  def prev_date
    Workday.where("skype_date < ?", skype_date).pluck(:skype_date).last
  end
end
