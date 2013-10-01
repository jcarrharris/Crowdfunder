class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password
  has_many :projects

  validates_presence_of :first_name, :last_name, :email, :password
end