class CreateViewedCampgrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :viewed_campgrounds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :campground, null: false, foreign_key: true

      t.timestamps
    end
  end
end
