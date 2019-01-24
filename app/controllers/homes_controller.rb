class HomesController < ApplicationController
  def index
    @projects = Project.all.order('id ASC')
    @schools = School.all
  end
end
