class User < ActiveRecord::Base
    
    has_many :time_entries
    validates :username, uniqueness: true, presence: true
    attr_accessor :arrival_time


	def self.authenticate(user_name)
    user = where(username: user_name.strip).first
    user.blank? ? false : user
	end
    
  def self.signup(username)
    create(username: username)
  end
   
  def self.validate_arrival_time(entry_time)
    arrival_time = TimeEntry.check_late_entry(entry_time)
  end

    # Log the arrival time for a user
	def checkin_user
	   entry_exist = time_entries.where("DATE(signin_time)=?", Date.today)
	   if entry_exist.blank?
	     time_entries.create(signin_time: DateTime.now)
	   end
	end
end
