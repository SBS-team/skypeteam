Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Skypeteam.config[:oauth_facebook][:key], Skypeteam.config[:oauth_facebook][:secret]
  provider :vkontakte, Skypeteam.config[:oauth_vk][:key], Skypeteam.config[:oauth_vk][:secret]
  provider :mailru, Skypeteam.config[:oauth_mail_ru][:key], Skypeteam.config[:oauth_mail_ru][:secret]
  provider :google, Skypeteam.config[:oauth_google][:key], Skypeteam.config[:oauth_google][:secret]
end
