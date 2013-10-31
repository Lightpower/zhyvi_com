function dateToDMY(date) {
  var d = date.getDate(),
      m = date.getMonth() + 1,
      y = date.getFullYear();
  return '' + (d <= 9 ? '0' + d : d) + '.' + (m<=9 ? '0' + m : m) + '.' + y;
}

function nextDate(date) {
  var retVal = new Date(date.getTime() + 86400000);
  if(retVal.getDate() == date.getDate()) retVal = new Date(retVal.getTime() + 86400000);
  return new Date(retVal.getFullYear(), retVal.getMonth(), retVal.getDate());
}

function prevDate(date) {
  var retVal = new Date(date.getTime() - 86400000);
  if(retVal.getDate() == date.getDate()) retVal = new Date(retVal.getTime() - 86400000);
  return new Date(retVal.getFullYear(), retVal.getMonth(), retVal.getDate());
}

function monthName(date) {
  var months = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Авнуст", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"];
  return months[date.getMonth()];
}