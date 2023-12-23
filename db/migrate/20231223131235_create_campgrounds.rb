class CreateCampgrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :campgrounds do |t|
      t.string :name
      t.text :overview
      t.string :state
      t.string :city
      t.string :cover_photo_url

      t.timestamps
    end
  end
end
