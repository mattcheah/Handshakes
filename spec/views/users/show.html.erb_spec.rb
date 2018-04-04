require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!({first: "Matt", last: "Cheah", email: "matt.cheah2345@gmail.com", password: "mattspassword"}))
  end

  it "renders attributes in <p>" do
    render
  end
end
