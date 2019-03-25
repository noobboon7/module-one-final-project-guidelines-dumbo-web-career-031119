class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.datetime :open
      t.datetime :close
      t.float :prices

      t.timestamps
    end
  end
end
