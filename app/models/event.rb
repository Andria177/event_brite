class Event < ApplicationRecord
    
    validates :title, presence: true, title: true, length: {in: 5..140}
    validates :description, presence: true, text: true, length: {in: 20..1000}
    validates :location, presence: true
    validates :price, presence: true, :inclusion => 1..1000
    validates :duration, presence: true, multiple: true
    validates :start_date, presence: true, beforenow: true

    
    belongs_to :admin, class_name: "User"
    has_many :attendances, dependent: :destroy
    has_many :users, through: :attendances

    def end_date
        return self.start_date + duration * 60
    end

end
