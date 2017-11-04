require 'rails_helper'

RSpec.describe User, type: :model do
    
    let(:user) { User.create!(first: "Matt", last: "Cheah", email: "matt.cheah@gmail.com", password: "password") }
    
    it { is_expected.to validate_presence_of(:first) }
    it { is_expected.to validate_length_of(:first).is_at_most(24) }
    
    it { is_expected.to validate_presence_of(:last) }
    it { is_expected.to validate_length_of(:last).is_at_most(24) }
    
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_length_of(:email).is_at_least(3) }
    it { is_expected.to allow_value("matt.cheah@gmail.com").for(:email) }
    
    # Shoulda tests for password
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    
    describe "attributes" do
        it "should have name and email attributes" do
            expect(user).to have_attributes(first: "Matt", last: "Cheah", email: "matt.cheah@gmail.com", password: "password")
        end
    end
    
end