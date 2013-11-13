class Event < ActiveRecord::Base
  belongs_to :user

  COLORS = %w(#30afcf #fa5757 #adc211 #fa9b02 #8b56cc #fa66ba)

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

  ##
  # Calculate event's color. It returns defined color or calculates it by title
  #
  def calculate_color

    self.color || color_by_title
  end

  private

  def color_by_title
    index = self.title.split('').inject(0) { |res, i| res ^  i.ord } % 6 rescue 0
    COLORS[index]
  end
end
