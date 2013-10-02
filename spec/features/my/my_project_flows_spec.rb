require 'spec_helper'

describe "Project Listing" do
  describe "when visiting the index page" do
    it "should list only my projects" do 
      me = setup_signed_in_user
      other_user = FactoryGirl.create :user

      3.times { FactoryGirl.create :project, user: me }
      2.times { FactoryGirl.create :project, user: other_user, title: "Other Dude's Project" }

      visit '/my/projects'

      page.should have_selector('div.project', count: 3)
      expect(page).to have_selector('div.project', count: 3)

      page.should have_no_content("Other Dude's Project")
      expect(page).to have_no_content("Other Dude's Project")
    end

    it "should edit my project" do
      me = setup_signed_in_user

      project = FactoryGirl.create :project, user: me, title: "My Project"

      visit edit_my_project_path(project)

      fill_in 'project[title]', with: "It is really my project"

      click_button 'Publish Project'

      expect(current_path).to eq(my_projects_path)

      page.should have_content("It is really my project")
      expect(page).to have_content("It is really my project")
    end

    it "should not be able to edit someone else's project" do
      me = setup_signed_in_user

      other_user = FactoryGirl.create :user
      project = FactoryGirl.create :project, user: other_user, title: "Other Dude's Project"

      expect { visit edit_my_project_path(project) }.to raise_error
    end

    it "should make projects public" do
      me = setup_signed_in_user
      # If we don't specify a user, it will needlessly CREATE a new one
      project = FactoryGirl.build(:project, user: me)

      visit 'my/projects/new'

      fill_in 'project[title]', with: "Test Project"
      fill_in 'project[teaser]', with: "Test Project Teaser"
      fill_in 'project[description]', with: "Test Project Description"
      fill_in 'project[goal]', with: "12000"

      click_button 'Publish Project'

      expect(current_path).to eq(my_projects_path)
    end
    it "should display navigation" do 
      user = setup_signed_in_user

      visit '/'

      page.find('.navbar ul').click_link('My Projects')
      expect(current_path).to eq(my_projects_path)

      # My Projects nav element should be active on the My Projects page
      expect(find('.navbar ul li.active a').text).to eq("My Projects")
      expect(page).to have_selector('.navbar ul li.active a', count: 1)

      # The nav element should still be active on the new project page
      click_link 'New Project'
      expect(current_path).to eq(new_my_project_path)
      expect(find('.navbar ul li.active a').text).to eq("My Projects")
    end
    it "should be able to delete my project" do 
      # Capybara.current_driver = Capybara.javascript_driver

      me = setup_signed_in_user
      project = FactoryGirl.create :project, user: me

      visit edit_my_project_path(project)

      assert has_link?("Delete Project")
      click_link 'Delete Project'

      # page.driver.accept_js_confirms! # Warning: this is specific to webkit driver

      page.should have_content('deleted')
      expect(page).to have_content('deleted')

      expect(Project.find_by_id(project.id)).to eq(nil)
      Project.find_by_id(project.id).should be_nil
    end
  end
end