module FormatdatetimeHelper

  # Feb.23.2018
  def format_header_date(date)
    date.strftime("%b.%d.%Y")
  end

  # Tuesday, October 10, 2017
  def formatFullDate(date)
    date.strftime("%A, %B %d, %Y")
  end
  # October 10, 2017
  def formatDate(date)
    date.strftime("%B %d, %Y")
  end
  # 9/19/17
  def formatAbreviatedDate(date)
    date.strftime("%-m/%d/%y")
  end
  # 4:38pm
  def formatTime(date)
    date.strftime("%-I:%M%p")
  end

  def formatPracticeTime(start_time, end_time)
    start_time.strftime("%l:%M%P") + " - " + end_time.strftime("%l:%M%P")
  end

  # Jul. 31, 2020 - Aug. 2, 2020
  def formatEventsDateRange(startdate, enddate)
    startdate.strftime("%b. %-d, %Y") + " - " + enddate.strftime("%b. %-d, %Y")
  end

  # Jul 31 - Aug. 2, 2020
  def formatDateRange(startdate, enddate)
    startdate.strftime("%B %-d") + " - " + enddate.strftime("%B %-d, %Y")
  end

  # 09/19/17 04:38pm
  def formatDateTime(date)
    date.strftime("%m/%d/%y %I:%M%p")
  end

  # First and Last Name on 9/19/17 at 4:38pm
  def formatModifiedNameandDate(concat_name, date)
    ("<strong>#{concat_name}</strong> on " + formatDateTimeWithAt(date)).html_safe
  end

  # 9/19/17 at 4:38pm
  def formatDateTimeWithAt(date)
    date.strftime("<strong>%-m/%d/%y</strong> at <strong>%-I:%M%p</strong>").html_safe
  end

end