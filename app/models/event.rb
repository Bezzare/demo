class Event < ActiveRecord::Base
    has_one :location
    has_many :attendees
    belongs_to :category
    validates_presence_of :name
end
