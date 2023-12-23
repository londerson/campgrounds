class Api::V1::UsersController < ApplicationController
  before_action :fetch_user, only: [:recently_viewed]

  def recently_viewed
    begin
      @compgrounds = Campground.find(@user.top_recently_viewed_campgrounds).as_json(only: [:id, :name, :overview, :city, :cover_photo_url])
      render json: { compgrounds: @compgrounds }
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    rescue StandardError => e
      render json: { error: e.message }, status: :internal_server_error
    end
  end

  private

  def fetch_user
    begin
    @user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
