class Article < ActiveRecord::Base
  belongs_to :user

  def category_name
    category = Category.find(self.category_id)
    return category[:name] if category
    ''
  end
end
