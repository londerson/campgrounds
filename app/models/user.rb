class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :viewed_campgrounds

  def top_recently_viewed_campgrounds(limit = 5)
    viewed_campgrounds.group(:campground_id).count.sort_by { |_k, v| -v }.map(&:first).uniq.first(limit)
  end
end
