class Pledge < ActiveRecord::Base
  attr_accessible :amount, :project_id, :user_id

  belongs_to :user
  belongs_to :project

  validates_presence_of :user_id
  validates_presence_of :project_id
  validates_numericality_of :amount, :greater_than => 0
end
