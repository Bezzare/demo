class Event < ActiveRecord::Base
    has_one :location
    has_many :attendees, :dependent => :delete_all
    belongs_to :category
    validates_presence_of :name

    has_many :event_groupships
    has_many :groups, :through => :event_groupships

    delegate :name, :to => :category, :prefix => true, :allow_nil => true

    accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank

    def closed?
        self.status == "CLOSED"
    end

    def open?
        !self.closed?
    end

    def open!
        self.status = "OPEN"
        self.save!
    end

    def close!
        self.status = "CLOSED"
        self.save!
    end
end
