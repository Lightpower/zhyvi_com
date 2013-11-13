module EventsPresenter

  ##
  # Presents JSON for creating the calendar of events
  #
  def calendar_json(events)
    ret_val = {}
    events.each do |event|
      ret_val[event.start_at.strftime('%d.%m.%Y')] = {
        id: event.id,
        title: event.title,
        preview: event.preview,
        color: event.calculate_color
      }
    end

    ret_val
  end
end
