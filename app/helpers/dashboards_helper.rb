module DashboardsHelper
  
  def late_entry(entry)
  	TimeEntry.check_late_entry(entry.signin_time)
  end

end
