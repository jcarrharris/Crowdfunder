namespace :mail do
  desc "sends various emails to users"
  task :projectstatus => :environment do
    Project.all.each do |project|
      UserMailer.project_status(project).deliver
    end
  end
end