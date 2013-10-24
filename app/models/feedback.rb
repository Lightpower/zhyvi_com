class Feedback < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :file_link

  def self.selected_list(limit=5)
    data = where(selected: true).order('created_at desc')
    data.first(limit) if limit
  end
end
