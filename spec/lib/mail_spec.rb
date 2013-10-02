require 'spec_helper'
require 'rake'

describe "rake" do

  before do
    Rake.application = Rake::Application.new
    load Rails.root + 'lib/tasks/mail.rake'

    # mail:projectstatus actually runs the environment task first
    # but... rspec already has the environment loaded
    # so we create a blank task, call it environment, and that's what will get run
    Rake::Task.define_task(:environment)

    # reset emails list. we made a helper for this, but it is in test::unit now...
    ActionMailer::Base.deliveries = []
  end

  describe "task mail:projectstatus" do

    it "should have 'environment' as a prerequisite" do
      expect(Rake::Task['mail:projectstatus'].prerequisites).to include("environment")
    end

    it "sends the right number of emails" do
      2.times { FactoryGirl.create :project }

      expect(Project.all.count).to be(2) # make sure there is no interference from other tests

      Rake::Task['mail:projectstatus'].invoke

      expect(ActionMailer::Base.deliveries.length).to be(2)
    end
  end
end