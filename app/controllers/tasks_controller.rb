class TasksController < ApplicationController
	def create 
		@project = Project.find(params[:project_id])#ターミナルでrake routesで出てくる:project_idを引っ張ってくる
		@task = @project.tasks.create(task_params)
		redirect_to project_path(@project.id)	
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to projects_path(params[:project_id])
	end	

	private #フィルタリングのために必要
		def task_params
			params[:task].permit(:title)
		end
end
