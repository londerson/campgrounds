class Api::V1::UsersController < ApplicationController
  before_action :fetch_user, only: [:recently_viewed]

  def recently_viewed
    @top_recently_viewed_campgrounds = Campground.find(@user.top_recently_viewed_campgrounds).as_json(only: [:id, :name, :overview, :city, :cover_photo_url])
    render json: { top_recently_viewed_campgrounds: @top_recently_viewed_campgrounds }
  end

  private

  def fetch_user
    @user = User.find(params[:user_id])
  end
end
