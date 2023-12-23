class CreateContributedPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :contributed_photos do |t|
      t.string :url
      t.integer :campground_id

      t.timestamps
    end
  end
end
