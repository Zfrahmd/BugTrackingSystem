class ProjectsController < ApplicationController
    # These are controller functions or actions

    def show
        # @ added in order to make the project object available to the whole app
        # without @ , project object will only be available to show function
        @project = Project.find(params[:id])
    end
    
    def index
        @projects = Project.all
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
        @project = @user.projects.build(params.require(:project).permit(:project_name, :description))
        #@project = Project.new(params.require(:project).permit(:project_name, :description))

        if @project.save
            flash[:notice] = "Project was created successfully"
            redirect_to project_path(@project.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @project = Project.find(params[:id])
        authorize! :update, @project
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(params.require(:project).permit(:project_name, :description))
            flash[:notice] = "Project was updated successfully"
            redirect_to project_path(@project.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @project = Project.find(params[:id])
        authorize! :destroy, @project
        @project.destroy
        redirect_to manage_projects_path
    end
end
