require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.create!(email: 'john@example1.com', password: 'adminadmin', password_confirmation: 'adminadmin')
    expect(user).to be_valid
  end

  describe '#top_recently_viewed_campgrounds' do
    let!(:user) { User.create!(email: 'john@example2.com', password: 'adminadmin', password_confirmation: 'adminadmin') }
    let!(:campground1) { Campground.create!(name: 'Campground 1', city: 'City 1')}
    let!(:campground2) { Campground.create!(name: 'Campground 2', city: 'City 2')}

    before do
      user.viewed_campgrounds.create!(campground: campground1)
      user.viewed_campgrounds.create!(campground: campground2)
    end

    it 'returns the correct top recently viewed campgrounds' do
      user.viewed_campgrounds.create!(campground: campground1)
      user.viewed_campgrounds.create!(campground: campground2)
    end
  end
end

