class CausesController < ApplicationController
    respond_to :json

    def index
        causes = Cause.all
        respond_with causes
    end
end
