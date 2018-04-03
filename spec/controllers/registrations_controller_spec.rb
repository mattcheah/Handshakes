require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
    
    
    describe "POST add_skill" do
        context "when user logged in" do
            login_user
            
            it "adds the skill to the array of skills" do
                post :add_skill, :params => {:skill => "new skill"} 
                
                expect(@user.skills[0].name).to eq("new skill")
                expect(@user.skills.count).to eq 1
            end
            
            it "does not add a skill if the skill already exists" do
               @user.skills = ["skill1", "skill2"]
               post :add_skill, {:skill => "new skill"} 
               expect(@user.skills.count).to eq 2
            end
            
        end
        
        context "when user is not logged in " do
            it "redirects to the homepage" do
                post :add_skill, :params => {skill: "new skill"} 
                expect(response).to redirect_to(root_path)
            end
        end
    end
    
    describe "POST add_cause" do
        context "when user logged in" do
            # login_user
            
            # it "adds the cause to the array of causes" do
            #     post add_cause, params => {cause: "new cause"}
            #     expect(@user.causes[0]).to eq("new cause")
            #     expect(@user.causes.count).to eq 1
            # end
            
            # it "does not add a cause if the cause already exists" do
            #   @user.causes = ["cause1", "cause2"]
            #   post add_cause, params => {cause: "cause1"}
            #   expect(@user.causes.count).to eq 2
            # end
            
        end
    end
    
end