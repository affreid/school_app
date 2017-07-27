class StudentsController < ApplicationController
	def index
		binding.pry
		@students = Student.all 
	end
end