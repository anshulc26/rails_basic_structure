class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.string :location
      t.json :photos
      t.datetime :start_date

      t.timestamps
    end
  end
end
