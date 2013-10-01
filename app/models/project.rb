class Project < ActiveRecord::Base
	belongs_to :user
	has_many :pledges
  	attr_accessible :description, :goal, :teaser, :title, :user_id



  	validates :title, presence: true, length: {maximum: 100}
  	validates :teaser, presence: true, length: {maximum: 255}
  	validates :description, presence: true
  	validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}
end
