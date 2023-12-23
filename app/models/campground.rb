class Campground < ApplicationRecord
  has_many :contributed_photos, dependent: :destroy
  has_many :viewed_campgrounds
end
