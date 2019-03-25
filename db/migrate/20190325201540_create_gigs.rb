class CreateGigs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
      t.integer :artist_id
      t.integer :venue_id
      t.string :events

      t.timestamps
    end 
  end
end
