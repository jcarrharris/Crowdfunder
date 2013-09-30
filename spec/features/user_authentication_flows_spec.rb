require 'spec_helper'

describe "User Authentication" do
  describe "when visiting the sign in page" do
    it "should successfully register a user" do

      visit "/users/new"
      expect(current_path).to eq(new_user_path)

      # Expect there is a link in the nav to Sign Up
      within(:css, '.navbar') do
        find_link("Sign Up").visible?
      end

      user = FactoryGirl.build(:user) 

      # Fill in the from with the info from user created by FactoryGirl
      fill_in "user[email]", :with => user.email
      fill_in "user[first_name]", :with => user.first_name
      fill_in "user[last_name]", :with => user.last_name
      fill_in "user[password]", :with => user.password
      click_button "Create Account"

      # After submitting the form, should be redirected to root
      expect(current_path).to eq(root_path)
      # While a message says "Account Created"
      page.should have_content("Account created")
      expect(page).to have_content("Account created")
      # And the nav no longer has a link to Sign Up but Logout
      within(:css, '.navbar') do
        has_no_link?('Sign Up')
        has_link?('Logout')
      end
    end

    it "should fail registration" do 
      visit "/users/new"
      user = FactoryGirl.build(:user) 

      # Invalid form submission ...
      fill_in "user[email]", :with => user.email
      click_button "Create Account"
      # Should redirect to users_path and ...
      expect(current_path).to eq(users_path)
      # ... no message saying "Account created" should appear

      page.should have_no_content("Account created")
      expect(page).to have_no_content("Account created")
    end
  end
end