class Event < ActiveRecord::Base
  belongs_to :user

  ##
  # Get events for calendar
  #
  # Params
  # date {Date} - date of month to detect the month which calendar is needed for.
  #
  # Returns
  # {Relation} - list of events for current month
  def self.for_calendar(date)
    start_date = date.beginning_of_month.beginning_of_week
    finish_date = date.end_of_month.end_of_week
    self.where('(start_at >= ? and start_at <= ?)', start_date, finish_date).order(:start_at)
  end
end
