class ProjectsController < ApplicationController

	def index#rake routesのうち行いたいアクションを定義する
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])#paramsでidを取得
	end

	def new
		@project = Project.new
	end

	def create 
		@project = Project.new(project_params)
		if @project.save #true validationに引っかからなかったら
		redirect_to projects_path
		else #false　引っかかったら
			render 'new'#newのviewに戻る
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path
	end

	private #フィルタリングのために必要
		def project_params
			params[:project].permit(:title)
		end
end
