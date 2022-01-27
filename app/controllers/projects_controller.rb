class ProjectsController < ApplicationController
    #load_and_authorize_resource
    before_action :find_project, only: [:show, :edit, :update, :destroy]
    def show
    end
    
    def index
        if current_user.manager?
            @projects = Project.where(user_id: current_user.id)
        elsif current_user.qa?
            @projects = Project.where(qa_id: current_user.id)
        else 
            @projects = Project.where(dev_id: current_user.id)
        end
    end

    def manage
        @projects = Project.all
    end

    def new
        @project = Project.new
        authorize! :create, @project
    end

    def create
        @user = current_user
        #@dev_user = User.find(3)
        @project = @user.projects.build(project_params)
        #@project = @dev_user.projects.build(project_params)
        #@project = Project.new(params.require(:project).permit(:project_name, :description))

        if @project.save
            flash[:notice] = "Project was created successfully"
            redirect_to project_path(@project.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        authorize! :update, @project
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "Project was updated successfully"
            redirect_to project_path(@project.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        authorize! :destroy, @project
        @project.destroy
        redirect_to manage_projects_path
    end

    def find_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:project_name, :description, :dev_id, :qa_id)
    end
end
