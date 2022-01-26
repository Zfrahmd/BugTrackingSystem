class BugsController < ApplicationController
    before_action :find_bug, only: [:show, :edit, :update, :destroy]

    def show  
    end

    def index
        @bugs = Bug.all
    end

    def manage
        @bugs = Bug.all
    end

    def new
        @bug = Bug.new
        authorize! :create, @bug
    end

    def create
        @user = current_user
        @bug = @user.bugs.build(bug_params)
        #@bug = Bug.new(params.require(:bug).permit(:title, :description, :bug_type, :feature_status, :bug_status, :deadline, :project_id, :image))
        if @bug.save
            flash[:notice] = "Bug was created successfully"
            redirect_to bug_path(@bug.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        authorize! :update, @bug
    end

    def update
        if @bug.update(bug_params)
            flash[:notice] = "Bug was updated successfully"
            redirect_to bug_path(@bug.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bug.destroy
        flash[:notice] = "Bug was deleted successfully"
        authorize! :destroy, @bug
        redirect_to manage_bugs_path
    end

    def find_bug
        @bug = Bug.find(params[:id])
    end

    def bug_params
        params.require(:bug).permit(:title, :description, :bug_type, :feature_status, :bug_status, :deadline, :project_id, :image)
    end
    
end