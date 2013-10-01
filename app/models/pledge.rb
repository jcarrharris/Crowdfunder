class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project_id, :user_id

  belongs_to :user, :project
end
