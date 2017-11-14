class SkillController < ApplicationController
    respond_to :json

    def index
        skills = Skill.all
        respond_with skills
    end
end
