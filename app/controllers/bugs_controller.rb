class BugsController < ApplicationController
    
    def show
        @bug = Bug.find(params[:id])   
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
        @bug = @user.bugs.build(params.require(:bug).permit(:title, :description, :bug_type, :feature_status, :bug_status, :deadline, :project_id, :image))
        #@bug = Bug.new(params.require(:bug).permit(:title, :description, :bug_type, :feature_status, :bug_status, :deadline, :project_id, :image))
        if @bug.save
            flash[:notice] = "Bug was created successfully"
            redirect_to bug_path(@bug.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @bug = Bug.find(params[:id])
        authorize! :update, @bug
    end

    def update
        @bug = Bug.find(params[:id])
        if @bug.update(params.require(:bug).permit(:title, :description, :bug_type, :feature_status, :bug_status, :deadline, :project_id, :image))
            flash[:notice] = "Bug was updated successfully"
            redirect_to bug_path(@bug.id)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @bug = Bug.find(params[:id])
        @bug.destroy
        flash[:notice] = "Bug was deleted successfully"
        authorize! :destroy, @bug
        redirect_to manage_bugs_path
    end
end