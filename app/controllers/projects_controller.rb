class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order('id ASC')
    respond_to do |format|
      format.html
      format.json {
        render json: @projects
      }
    end
  end
end
