module ApplicationHelper
  def show_with_type(text,type)
    case type
      when "image"
        image_tag text.gsub(" ","")
      else
        text
    end
  end
end
