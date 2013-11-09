module ApplicationHelper

  def category_divs
    Category.all.map { |category|
      content_tag(:div, content_tag(:span, category[:name].mb_chars.upcase, class: 'h'), class: 'category shadow', 'data-index' => category[:id])

#      content_tag(:div, category[:name].mb_chars.upcase, class: "category shadow", 'data-index' => category[:id])
    }.join.html_safe
  end

  def category_images
    Category.all.map { |category|
      content_tag(:div, image_tag(category[:url]), class: 'category_image', style: 'display: none;', 'data-index' => category[:id])
    }.join.html_safe
  end

  ##
  #  Show flash messages
  #
  def show_flash
    [:notice, :alert, :error].map { |type|
      content_tag(:div, flash[type], class: type) if flash[type]
    }.join.html_safe
  end

  ##
  # Format datetime
  #
  def format(datetime)
    datetime.try(:strftime, '%d.%m.%Y %H:%M')
  end
end
