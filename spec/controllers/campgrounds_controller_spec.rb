require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do
  include Warden::Test::Helpers
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    let!(:user) { User.create!(email: 'john@example.com', password: 'adminadmin', password_confirmation: 'adminadmin') }

    context 'when user is authenticated' do
      before do
        sign_in user

        @campground1 = Campground.create!(name: 'Campground 1', city: 'City 1')
        @campground2 = Campground.create!(name: 'Campground 2', city: 'City 2')
        get :index
      end

      it 'assigns @campgrounds' do
        expect(assigns(:campgrounds)).to match_array([@campground1, @campground2])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    let!(:user) { User.create!(email: 'john@example.com', password: 'adminadmin', password_confirmation: 'adminadmin') }

    before do
      @campground = Campground.create!(name: 'Campground 1', city: 'City 1')
    end

    context 'when user is authenticated' do
      before do
        sign_in user
        get :show, params: { id: @campground.id }
      end

      it 'assigns @campground' do
        expect(assigns(:campground)).to eq(@campground)
      end

      it 'creates a viewed_campground record' do
        expect(ViewedCampground.last.campground).to eq(@campground)
      end

      it 'renders the show template' do
        expect(response).to render_template(:show)
      end
    end

    context 'when user is not authenticated' do
      it 'does not create a viewed_campground record' do
        expect { get :show, params: { id: @campground.id } }.not_to change(ViewedCampground, :count)
      end
    end
  end

  describe 'GET #recently_viewed' do
    let!(:user) { User.create!(email: 'john@example.com', password: 'adminadmin', password_confirmation: 'adminadmin') }

    context 'when user is authenticated' do
      before do
        sign_in user
        @campground1 = Campground.create!(name: 'Campground 1', city: 'City 1')
        @campground2 = Campground.create!(name: 'Campground 2', city: 'City 2')

        user.viewed_campgrounds.create!(campground: @campground1)
        user.viewed_campgrounds.create!(campground: @campground2)
        get :recently_viewed
      end

      it 'assigns @recently_viewed_campgrounds' do
        expect(assigns(:recently_viewed_campgrounds)).to match_array([@campground1, @campground2])
      end

      it 'renders the recently_viewed template' do
        expect(response).to render_template(:recently_viewed)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to login page' do
        get :recently_viewed
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

