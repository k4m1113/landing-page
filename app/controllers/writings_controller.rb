class WritingsController < ApplicationController
  def index
    @writings = Writing.all
  end

  def show
    @writing = Writing.find(params[:id])
  end
end
