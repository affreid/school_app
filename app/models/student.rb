class Student < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :full_name, presence: true

	has_many :projects, dependent: :destroy

	has_many :student_courses
	has_many :courses, through: :student_courses
end 
