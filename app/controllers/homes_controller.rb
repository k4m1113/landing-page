class HomesController < ApplicationController
  def index
    @projects = Project.all.order('id ASC')
  end
end
