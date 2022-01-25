class PagesController < ApplicationController
  def home
    @projects = Project.all
  end
  #before_action :authenticate_user!
end

