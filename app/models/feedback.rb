class Feedback < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :file
end
