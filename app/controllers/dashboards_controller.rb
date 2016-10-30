class DashboardsController < ApplicationController

	def index
	  @time_entries = TimeEntry.all.order(signin_time: :desc)
	end

	def arrival_stats
	end
end
