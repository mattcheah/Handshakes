class SkillsController < ApplicationController
    respond_to :json

    def index
        @skills = Skill.all
        render json: @skills
    end
    
    def show
       @skill = Skill.find(params[:id])
       render json: @skill
    end
    
    def create
        @skill = Skill.create(new_skill_params)
        if @skill.save
            flash[:notice] = "Skill successfully created"
            render json: @skill, status: :created
        else
            render json: @skill, status: :unprocessable_entity
        end
    end
    
    def destroy 
    
        @skill = Skill.find(params[:id])
        if @skill.destroy
            flash[:notice] = "Skill: #{@skill.name} successfully deleted!"
            render json: Skill.all, status: :ok
        else
            # flash[:alert] = "Skill could not be deleted. Please try again."
            render json: @skill, status: :unprocessable_entity
        end
    
    end
    
    private
    
    def new_skill_params
        params.require(:skill).permit!
    end
end
