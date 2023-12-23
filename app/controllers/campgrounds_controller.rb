class CampgroundsController < ApplicationController
  def index
    @campgrounds = Campground.all
  end

  def show
    @campground = Campground.find(params[:id])
  end
end
