class AppointmentActionController < ApplicationController
    def index
        @actions = Action.group(:name, :result).count(:name)
    end
end
