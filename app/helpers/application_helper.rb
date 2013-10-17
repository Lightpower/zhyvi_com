module ApplicationHelper

  def category_divs
    Category.all.map { |category|
      content_tag(:div, category[:name].mb_chars.upcase, class: 'category shadow', 'data-index' => category[:id])
    }.join.html_safe
  end

  def category_images
    Category.all.map { |category|
      content_tag(:div, category[:url].mb_chars.upcase, class: 'category shadow', 'data-index' => category[:id])
    }.join.html_safe
  end
end
