class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email,:last_url, :ban_reason
  has_many :comments
  has_many :likes

  before_save :clear_ban_reason

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def banned?
    !!ban_reason
  end

  private

  def clear_ban_reason
    self.ban_reason = nil if self.ban_reason.blank?
  end

end
