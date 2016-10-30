class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.references :user
      t.datetime :signin_time
      t.datetime :signout_time
    end
  end
end
