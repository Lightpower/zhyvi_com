// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

ZH.events = {
  days: 86400000,

  reload: function(startDate) {
    var events,
        calendarDiv = $("div#calendar"),
        calendarDivSmall = $("div#calendar_small"),
        full = calendarDiv.length > 0,
        actionUrl;
    if(!full) {
      calendarDiv = calendarDivSmall;
    }
    actionUrl = calendarDiv.data("url");

    $.ajax({
      type: 'GET',
      url: actionUrl,
      dataType: 'json',
      data: { start_date: startDate }
    }).done(function(message) {
        events = message;
        calendarDiv.html(ZH.events.build(startDate, events, full));
      });

  },

  build: function(startDate, events, full) {
    if(full) return ZH.events.build_full(startDate, events);
        else return ZH.events.build_small(startDate, events);
  },

  build_full: function(startDate, events) {
    var firstDate = ZH.events.calendarStart(startDate),
      lastDate  = ZH.events.calendarEnd(startDate),
      currentDate = firstDate,
    // Month row
      calendar  = '<div class="month">' + monthName(startDate) + '</div>',
      event,
      row = '',
      i = 0,
      days = ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'],
      color, dataId, dataPreview;

    // Days on week row
    calendar  += '<div class="calendar row">';
    for(; i<7; i++) {
      calendar += '<div class="calendar th' + ((i === 0) ? '_first':'') +'">' + days[i] + '</div>';
    }
    calendar  += '</div>';

    // Main calendar rows
    for(; currentDate <= lastDate; currentDate = nextDate(currentDate)) {
      if(currentDate.getDay() == 1) {
        row = '<div class="calendar row">';
        row += '<div class="calendar day_first">';
      }else{
        row += '<div class="calendar day">';
      }
      event = events[dateToDMY(currentDate)];

      if(event) {
        color = ' style="background-color: ' + event.color + ';"';
        dataId = ' data-id="' + event.id + '"';
        dataPreview = ' data-preview="' + event.preview + '"';
        row += '<div class="event"' + color + dataId + dataPreview + '>';
        //row += currentDate.getDate();
        row += '<div>';
        row += event.title;
        row += '</div>';
        row += '<div class="tool-wrapper"><div class="tooltipContent"' + color + '>' + event.preview + '</div></div>';
        row += '</div>';
      }else{
        //row += currentDate.getDate();
      }

      row += '</div>';
      if(currentDate.getDay() == 0) {
        row += '</div>'
        calendar += row;
      }
    }

    return calendar;
  },

  build_small: function(startDate, events) {
    var firstDate = ZH.events.calendarStart(startDate),
      lastDate  = ZH.events.calendarEnd(startDate),
      currentDate = firstDate,
      calendar ='',
      event,
      row = '',
      color, dataId, dataPreview;

    // Main calendar rows
    for(; currentDate <= lastDate; currentDate = nextDate(currentDate)) {
      if(currentDate.getDay() == 1) {
        row = '<div class="row">';
      }

      row += '<div class="day">';
      event = events[dateToDMY(currentDate)];

      if(event) {
        color = ' style="background-color: ' + event.color + ';"';
        dataId = ' data-id="' + event.id + '"';
        dataPreview = ' data-preview="' + event.preview + '"';
        row += '<div class="event"' + color + dataId + dataPreview + ' >';
        row += '<div class="tool-wrapper"><div class="tooltipContent"' + color + '>' + event.preview + '</div></div>';
        row += '</div>';
      }else{
        //row += currentDate.getDate();
      }

      row += '</div>';
      if(currentDate.getDay() == 0) {
        row += '</div>'
        calendar += row;
      }
    }

    return calendar;
  },

  calendarStart: function(date) {
    var firstDate = new Date(date.getFullYear(), date.getMonth(), 1);
    return new Date(firstDate.getTime() - ((firstDate.getDay() || 7) - 1)* ZH.events.days);
  },
  calendarEnd: function(date) {
    var lastDate = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    return new Date(lastDate.getTime() + (7 - (lastDate.getDay() || 7))* ZH.events.days);
  },

  show: function(event) {
    var url = $(event).parents('div#calendar-wrapper').data('url') + '/' + $(event).data('id') + '?js=1';
    window.location = url;
  }
};


$(function() {
  ZH.events.reload(new Date());

  $(document).on({
    mouseenter: function () {
      var tooltip = $("> div.tool-wrapper", this).show();
      var pos = tooltip.offset();
      tooltip.hide();
      var right = pos.left + tooltip.width();
      var pageWidth = $(document).width();
      if (pos.left < 0) {
        tooltip.css("marginLeft", "+=" + (-pos.left) + "px");
      }
      else if (right > pageWidth) {
        tooltip.css("marginLeft", "-=" + (right - pageWidth));
      }
      tooltip.fadeIn();
    },
    mouseleave: function () {
      $("> div.tool-wrapper", this).fadeOut(function() {$(this).css("marginLeft", "");});
    }
  }, "#calendar-wrapper .event"); //pass the element as an argument to .on

  $(document).on("click", "div.event, dev.event .tooltipContent", function() {
    ZH.events.show(this);
  });
});