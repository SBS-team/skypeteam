module ApplicationHelper
  def show_with_type(text,type)
    case type
      when "image"
        image_tag text.gsub(" ","")
      when "youtube"
        raw youtube_embed(text.gsub(" ",""))
      when "link_to"
        link_to text, text.gsub(" ",""), :rel => :nofollow, :target => :blank
      else
        text
    end
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="0" allowfullscreen></iframe>}
  end

  def gravatar_url(user, size = 64)
    gravatar_id = Digest::MD5::hexdigest(user.email || user.name).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=wavatar&s=#{size}"
  end
end
