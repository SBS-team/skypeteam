class OriginalText < ActiveRecord::Base
  attr_accessible :body, :status, :parsed_body, :workday_date, :messages_count
  serialize :parsed_body
  has_one :workday
  before_save :parse_text
  TYPE_OF_CONTENT = {
      "[img]" => :image,
      "[youtube]" => :youtube,
      "[url]" => :link_to
  }

  def name
    "#{id}-#{status}"
  end

  def create_messages
    self.workday.destroy if status && self.workday

    workday_id = Workday.create!(skype_date: workday_date, original_text_id: id).id
    self.update_attribute(:status, true)
    parsed_body.each do |hash|
      Message.create(hash.merge!(:workday_id => workday_id))
    end
  end

  private

  def parse_text
    tmp_body = []
    body.scan(/(\[.*\])\s*([^:]+):\s?(.+)/).each do |time_or_content_type, nick, msg|
      member_id = MemberAlias.where(:real_name => nick).first.try(:id)
      tmp_body << {:member_id => member_id, :body => msg, :body_type => (TYPE_OF_CONTENT[time_or_content_type])}
    end
    self.parsed_body = tmp_body
    self.messages_count = tmp_body.count
  end

end
