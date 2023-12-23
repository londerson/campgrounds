class CampgroundsController < ApplicationController
  before_action :authenticate_user!

  def index
    @campgrounds = Campground.all
  end

  def show
    @campground = Campground.find(params[:id])

    if current_user
      current_user.viewed_campgrounds.create(campground: @campground)
    end
  end

  def recently_viewed
    @recently_viewed_campgrounds = Campground.find(current_user.top_recently_viewed_campgrounds)
  end
end
