class AddMeetupLocationToVerifications < ActiveRecord::Migration[5.0]
  def change
     add_column :verifications, :meetup_location, :string
  end
end
