# require 'rails_helper'
#
# describe "Create Photos" do
#   it "Create and View Photo" do
#     user = FactoryGirl.create(:user)
#     visit '/users/sign_in'
#     fill_in 'Email', :with => 'j@email.com'
#     fill_in 'Password', :with => 'password'
#     click_on 'Log in'
#     click_on 'You'
#     click_on 'New photo'
#     fill_in 'Image Title', :with => 'Denzel'
#     fill_in 'Image Details', :with => 'details'
#     page.attach_file("Image File", 'spec/fixtures/images/test.jpg')
#     click_on 'Create Photo'
#     click_on 'Denzel'
#     expect(page).to have_content 'Denzel'
#   end
# end
#
# describe "CRUD Photos" do
#   it "Edit Photo" do
#     user = FactoryGirl.create(:user)
#     user = FactoryGirl.create(:photo)
#     visit '/users/sign_in'
#     fill_in 'Email', :with => 'j@email.com'
#     fill_in 'Password', :with => 'password'
#     click_on 'Log in'
#     click_on 'Denzel'
#     click_on 'Edit'
#     fill_in 'Image Title', :with => 'Halle Berry'
#     fill_in 'Image Details', :with => 'actress'
#     page.attach_file("Image File", 'spec/fixtures/images/test2.jpg')
#     click_on 'Update Photo'
#     expect(page).to have_content 'Halle Berry'
#   end
#   it "Delete Photo" do
#     user = FactoryGirl.create(:user)
#     user = FactoryGirl.create(:photo)
#     visit '/users/sign_in'
#     fill_in 'Email', :with => 'j@email.com'
#     fill_in 'Password', :with => 'password'
#     click_on 'Log in'
#     click_on 'Denzel'
#     click_on 'Delete photo'
#     expect(page).to_not have_content 'Denzel'
#   end
# end
#
#
# describe "CRUD Tags" do
#   it "Add Tag" do
#     user = FactoryGirl.create(:user)
#     user = FactoryGirl.create(:photo)
#     visit '/users/sign_in'
#     fill_in 'Email', :with => 'j@email.com'
#     fill_in 'Password', :with => 'password'
#     click_on 'Log in'
#     click_on 'Denzel'
#     click_on 'Add Tag'
#     fill_in 'Tag Name', :with => 'actor'
#     click_on 'Create Tag'
#     click_on 'Denzel'
#     expect(page).to have_content 'actor'
#   end
#   it "Rename and Delete Tag" do
#     user = FactoryGirl.create(:user)
#     user = FactoryGirl.create(:photo)
#     visit '/users/sign_in'
#     fill_in 'Email', :with => 'j@email.com'
#     fill_in 'Password', :with => 'password'
#     click_on 'Log in'
#     click_on 'Denzel'
#     click_on 'Add Tag'
#     fill_in 'Tag Name', :with => 'actor'
#     click_on 'Create Tag'
#     click_on 'Denzel'
#     click_on 'Rename'
#     fill_in 'Tag Name', :with => 'Ghost'
#     click_on 'Update Tag'
#     click_on 'Ghost X'
#     expect(page).to_not have_content 'Ghost'
#   end
# end
