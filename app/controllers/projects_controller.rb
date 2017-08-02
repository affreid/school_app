class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:search].present?
			#search logic
			@projects = Project.search(params[:search])
		else
			@projects = Project.all 
		end
			
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find_by_id(params[:id])
	end

	def show 
		@project = Project.find_by_id(params[:id])
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			#happy path
			#redirect_to student_path(@student), notice: "Student was added successfully"
			flash[:notice] = 'Project was added successfully'
			redirect_to project_path(@project)

		else
			#unhappy path
			flash[:alert] = 'There was an error creating the project'
			render :new
		end
	end

	def update
		@project = Project.find_by_id(params[:id])
		
		if @project.update_attributes(project_params)
			redirect_to projects_path, notice: 'Project was updated successfully'
		else
			flash[:alert] = 'There was an error updating the project'
			render :new 
		end 
	end

	def destroy
		@project = Project.find_by_id(params[:id])

		if @project.destroy
			flash[:notice] = "#{@project.name} was successfully deleted"
		else
			flash[:alert] = "There was an error while attempting to delete this"
		end

		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:name, :student_id)
	end
end
