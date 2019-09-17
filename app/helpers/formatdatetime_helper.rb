module FormatdatetimeHelper

  # Feb.23.2018
  def format_header_date(date)
    date.strftime("%b.%d.%Y")
  end

  # Tuesday, October 10, 2017
  def formatFullDate(date)
    date.strftime("%A, %B %d, %Y")
  end
  # 09/19/17
  def formatDate(date)
    date.strftime("%m/%d/%y")
  end

  def formatTime(date)
    date.strftime("%I:%M%p")
  end

  # 09/19/17 04:38pm
  def formatDateTime(date)
    date.strftime("%m/%d/%y %I:%M%p")
  end

  # 09/19/17 at 04:38pm
  def formateDateTimeWithAt(date)
    date.strftime("%m/%d/%y at %I:%M%p")
  end

end