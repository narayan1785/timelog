class TimeEntry < ActiveRecord::Base
  belongs_to :user

  def self.check_late_entry(entry_time)
  	hr = entry_time.localtime.strftime("%H").to_i < 10 ? true  : false
  	hr ? "in" : "late"
  end

  def self.avg_arrival_time
  	#select SEC_TO_TIME(AVG(TIME_TO_SEC(signin_time))) as avg_date from time_entries;
  end

end
