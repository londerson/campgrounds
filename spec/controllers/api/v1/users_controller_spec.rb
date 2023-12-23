require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #recently_viewed' do
    let!(:user) { User.create!(email: 'john@example.com', password: 'adminadmin', password_confirmation: 'adminadmin') }
    let!(:campground1) { Campground.create!(name: 'Campground 1', city: 'City 1') }
    let!(:campground2) { Campground.create!(name: 'Campground 2', city: 'City 2') }

    context 'when user is found' do
      before { get :recently_viewed, params: { user_id: user.id } }

      it 'returns a successful response' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns JSON with top recently viewed campgrounds' do
        expect(JSON.parse(response.body)).to have_key('compgrounds')
      end
    end

    context 'when user is not found' do
      before { get :recently_viewed, params: { user_id: 'invalid_id' } }

      it 'returns a not found response' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns JSON with an error message' do
        expect(JSON.parse(response.body)).to have_key('error')
        expect(JSON.parse(response.body)['error']).to eq('User not found')
      end
    end
  end
end

