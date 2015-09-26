class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update, :destroy]#どのアクションの前にも実行される

	def index#rake routesのうち行いたいアクションを定義する
		@projects = Project.all
	end

	def show
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
	end

	def update
		
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end

	def destroy
		
		@project.destroy
		redirect_to projects_path
	end

	private #フィルタリングのために必要
		def project_params
			params[:project].permit(:title)
		end
		#他から参照されないのでprivateの中で作っていく

		def set_project
			@project = Project.find(params[:id])#paramsでidを取得
		end
end
