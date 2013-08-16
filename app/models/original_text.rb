class OriginalText < ActiveRecord::Base
  attr_accessible :body, :status, :parsed_body, :workday_date, :messages_count
  serialize :parsed_body
  has_one :workday
  before_save :parse_text
  TYPE_OF_CONTENT = {
      "[img]" => :image,
      "[youtube]" => :youtube,
      "[url]" => :link_to,
      "[vk]" => :vk,
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
    split_body = body.split(/(\[.*\])/)
    logger.info(split_body)
    split_body.each_with_index do |text, i|
      unless i%2 == 1
        member_id = nil
        MemberAlias.all.each do |ma|
          if text.sub!(ma.real_name, "")
            member_id = ma.member_id
            break
          end
        end
        if text.include?('http://vk.com/video')
          text = vk_embed(text.gsub(" ",""))
        end
        tmp_body << {:member_id => member_id, :body => text, :body_type => (TYPE_OF_CONTENT[split_body[i-1]])}
      end
    end
    self.parsed_body = tmp_body
    self.messages_count = tmp_body.count
  end

  def vk_embed(vk_url)
    vk_add = vk_url[/http:\/\/vk\.com\/[^\?\s]*/]
    doc = Nokogiri::HTML(open(vk_add))
    az = vk_add.gsub("http://vk.com/video","")
    @vk_oid = az.split('_').first
    @vk_id = az.split('_').last
    @te =[]
    doc.xpath('//meta').map { |x| @te << x }
    @final = ''
    @te.each do |a|
      if a['content'].include? "http://vk.com/video?act=get_swf&oid=#{@vk_oid}&vid=#{@vk_id}&embed_hash="
        @final = a['content'].split('=').last
      end
    end
    @body_text = vk_url.gsub(vk_add,%Q{<iframe src="http://vk.com/video_ext.php?oid=#{@vk_oid}&id=#{@vk_id}&hash=#{@final}&hd=1" width="607" height="360" frameborder="0"></iframe>})
    return @body_text
  end
end
