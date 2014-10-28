class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    # @project = Project.find(params[:id])
    @project_name = params[:project_name]
    @stories = Story.find(params[:id])
  end
end