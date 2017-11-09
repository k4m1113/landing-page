class ProjectsController < ApplicationController
  def index
    @projects = Project.all.order('id ASC')
  end
end
