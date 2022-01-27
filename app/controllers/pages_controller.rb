class PagesController < ApplicationController
  
  def home
    #@projects = Project.all
    if current_user
      if current_user.manager?
        @projects = Project.where(user_id: current_user.id)
      elsif current_user.qa?
        @projects = Project.where(qa_id: current_user.id)
      else 
        @projects = Project.where(dev_id: current_user.id)
      end
    end
  end
  #before_action :authenticate_user!
end

