class EventStatesController < ApplicationController
    def create
        Event.find(params[:event_id]).open!
        redirect_to :back
    end

    def destroy
        Event.find(params[:event_id]).close!
        redirect_to :back
    end
end
