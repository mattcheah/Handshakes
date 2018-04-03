class CausesController < ApplicationController
    respond_to :json

    def index
        @causes = Cause.all
        render json: @causes
    end
    
    def show
       @cause = Cause.find(params[:id])
       render json: @cause
    end
    
    def create
        @cause = Cause.create(new_cause_params)
        if @cause.save
            flash[:notice] = "cause successfully created"
            render json: @cause, status: :created
        else
            render json: @cause, status: :unprocessable_entity
        end
    end
    
    def destroy 
    
        @cause = Cause.find(params[:id])
        if @cause.destroy
            flash[:notice] = "cause: #{@cause.name} successfully deleted!"
            render json: Cause.all, status: :ok
        else
            # flash[:alert] = "cause could not be deleted. Please try again."
            render json: @cause, status: :unprocessable_entity
        end
    
    end
    
    private
    
    def new_cause_params
        params.require(:cause).permit!
    end
end
