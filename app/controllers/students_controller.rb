class StudentsController < ApplicationController
	before_action :authenticate_user!


	def index
		@students = Student.all  
	end

	def show
		@student = Student.find_by_id(params[:id])
		@projects = @student.projects
		@courses = @student.courses
	end

	def new
		@student = Student.new
	end

	def edit
		@student = Student.find_by_id(params[:id])
	end

	def update
		@student = Student.find_by_id(params[:id])
		
		if @student.update_attributes(student_params)
			redirect_to students_path, notice: 'Student was updated successfully'
		else
			flash[:alert] = 'There was an error updating the student'
			render :edit 
		end 

		#if student is found
		#call update attributes on student and pass in values
		#show flash message confirming the successful update
		#redirect to the index page
		#if student is not found
		#render :edit page with flash message informing user of an error
	
	end

	def create
		
		@student = Student.new(student_params)

		if @student.save
			#happy path
			#redirect_to student_path(@student), notice: "Student was added successfully"
			flash[:notice] = 'Student was added successfully'
			redirect_to student_path(@student)

		else
			#unhappy path
			flash[:alert] = 'There was an error creating the student'
			render :new
		end
	end

	def destroy
		@student = Student.find_by_id(params[:id])

		if @student.destroy
			flash[:notice] = "#{@student.email} was successfully deleted"
		else
			flash[:alert] = "There was an error while attempting to delete this"
		end

		redirect_to students_path
	end

	private

	def student_params
		params.require(:student).permit(:email, :full_name, :phone, :hero, :course_ids => [])
	end
end