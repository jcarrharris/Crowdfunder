class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password
  has_many :projects
  has_many :pledges

  validates_presence_of :first_name, :last_name, :email, :password

  def name
  	"#{:first_name} + " " + #{:last_name}"
  end
end