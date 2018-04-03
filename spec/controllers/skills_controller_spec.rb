require 'rails_helper'

RSpec.describe SkillsController, type: :controller do

    before(:all) do
        unless Skill.all.length > 0 
            load "#{Rails.root}/db/seeds.rb"
        end
    end
  
  describe "skills INDEX" do
  
    it "returns success" do
        get :index
        expect(response).to have_http_status(:success)
    end
    
    it "makes all @skills available" do
        all_skills = Skill.all
        get :index
        expect(assigns(:skills)).to eq(all_skills)
    end
  
  end
  
  describe "skills SHOW" do
    
    let(:new_skill) { create(:skill, {name: "test show", category: "test show"}) }
      
    it "returns success" do
        get :show, params: {id: new_skill.id}
        expect(response).to have_http_status(:success)
    end
    
    it "returns success" do
        get :show, params: {id: new_skill.id}
        
        expect(assigns(:skill).name).to eq "test show"
        expect(assigns(:skill).category).to eq "test show"
    end
  end
  
  describe "skills CREATE" do
      before(:each) do
        @valid_params = {name: "New Skill", category: "New Category", description: "New Description"}
        @attrs = attributes_for(:skill)
      end
      
      it "returns success" do
        post :create, params: {skill: @attrs} 
        expect(response).to have_http_status(:success)
      end
      
      it "persists the skill to the database" do
        post :create, params: {skill: @valid_params} 
        expect(Skill.last.name).to eq "New Skill"
        expect(Skill.last.category).to eq "New Category"
        expect(Skill.last.description).to eq "New Description"
      end
      
      it "increases the count of skills by 1" do
        expect{
            post :create, params: {skill: @attrs} 
        }.to change{Skill.all.count}.by 1
      end
      
      it "does not allow for a duplicate Skill name" do
        post :create, params: {skill: @valid_params} 
        expect{
            post :create, params: {skill: @valid_params} 
        }.to_not change{Skill.all.count}
      end
  end
  
  describe "skills DESTROY" do
     before(:each) do
        @skill = create(:skill)
     end
     
     it "returns success" do
        delete :destroy, params: {id: Skill.last.id} 
        expect(response).to have_http_status(:success)
     end
     
     it "removes the specified skill from the database" do
        delete :destroy, params: {id: Skill.last.id} 
        expect(Skill.find_by_id(@skill.id)).to be_nil
     end
     
     it "decreases the count of skills by 1" do
        expect {
            delete :destroy, params: {id: @skill.id}
        }.to change{Skill.all.count}.by -1
     end
     
  end

end
