class Campground < ApplicationRecord
  has_many :contributed_photos, dependent: :destroy
end
