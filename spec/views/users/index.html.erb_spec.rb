require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!({first: "Matt", last: "Cheah", email: "matt.cheah2345@gmail.com", password: "mattspassword"}),
      User.create!({first: "Matt", last: "Cheah", email: "matt.cheah23456@gmail.com", password: "mattspassword"})
    ])
  end

  it "renders a list of users" do
    render
  end
end
