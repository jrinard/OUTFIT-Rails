require 'rails_helper'

describe "create User" do
  it "adds a user and logs in" do
    visit '/users/sign_in'
    click_on 'Sign up'
    fill_in 'Username', :with => 'clark'
    fill_in 'Email', :with => 'c@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end
