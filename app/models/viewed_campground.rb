class ViewedCampground < ApplicationRecord
  belongs_to :user
  belongs_to :campground
end
