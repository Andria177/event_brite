class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    def self.users(event)
        @participants = Array.new
        @users = Attendance.where(event_id: event.id)
        @users.each do |user|
            @participants << user.user
        end
        return @participants
    end

end
