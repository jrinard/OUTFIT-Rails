require 'rails_helper'

describe "Project Paths", type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  describe "Create and View Project", :vcr => true do
    it "allows the user to create new Project" do
      visit new_picture_path
      fill_in 'Title', :with => 'Code'
      fill_in 'Description', :with => 'Code'
      # page.attach_file("#image", 'spec/fixtures/images/test.jpg')
      click_on 'Save'
      expect(page).to have_content 'Code'
    end
    it "allows the user to fail at creating a picture" do
      visit new_picture_path
      fill_in 'Description', :with => 'Code'
      click_on 'Save'
      expect(page).to have_content 'New Outfit'
    end
  end
  # describe "DELETES", :vcr => true do
  #   it "delete a job" do
  #     visit new_picture_path
  #     fill_in 'Description', :with => 'Code'
  #     click_on 'Save'
  #     # click_link('edit')
  #     find("#edit").click
  #     # click_on 'Delete Project'
  #     expect(page).to_not have_content 'BIG'
  #   end
  # end

end
