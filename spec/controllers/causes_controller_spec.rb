require 'rails_helper'

RSpec.describe CausesController, type: :controller do

    before(:all) do
        unless Cause.all.length > 0 
            load "#{Rails.root}/db/seeds.rb"
        end
    end
  
  describe "causes INDEX" do
  
    it "returns success" do
        get :index
        expect(response).to have_http_status(:success)
    end
    
    it "makes all @causes available" do
        all_causes = Cause.all
        get :index
        expect(assigns(:causes)).to eq(all_causes)
    end
  
  end
  
  describe "causes SHOW" do
    
    let(:new_cause) { create(:cause, {name: "test cause", category: "test cause"}) }
      
    it "returns success" do
        get :show, params: {id: new_cause.id}
        expect(response).to have_http_status(:success)
    end
    
    it "returns success" do
        get :show, params: {id: new_cause.id}
        
        expect(assigns(:cause).name).to eq "test show"
        expect(assigns(:cause).category).to eq "test show"
    end
  end
  
  describe "causes CREATE" do
      before(:each) do
        @valid_params = {name: "New Cause", category: "New Category", description: "New Description"}
        @attrs = attributes_for(:cause)
      end
      
      it "returns success" do
        post :create, params: {cause: @attrs} 
        expect(response).to have_http_status(:success)
      end
      
      it "persists the cause to the database" do
        post :create, params: {cause: @valid_params} 
        expect(Cause.last.name).to eq "New Cause"
        expect(Cause.last.category).to eq "New Category"
        expect(Cause.last.description).to eq "New Description"
      end
      
      it "increases the count of causes by 1" do
        expect{
            post :create, params: {cause: @attrs} 
        }.to change{Cause.all.count}.by 1
      end
      
      it "does not allow for a duplicate Cause name" do
        post :create, params: {cause: @valid_params} 
        expect{
            post :create, params: {cause: @valid_params} 
        }.to_not change{Cause.all.count}
      end
  end
  
  describe "causes DESTROY" do
     before(:each) do
        @cause = create(:cause)
     end
     
     it "returns success" do
        delete :destroy, params: {id: Cause.last.id} 
        expect(response).to have_http_status(:success)
     end
     
     it "removes the specified cause from the database" do
        delete :destroy, params: {id: Cause.last.id} 
        expect(Cause.find_by_id(@cause.id)).to be_nil
     end
     
     it "decreases the count of causes by 1" do
        expect {
            delete :destroy, params: {id: @cause.id}
        }.to change{Cause.all.count}.by(-1)
     end
     
  end


end
