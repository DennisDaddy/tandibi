class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :locale
      t.st_point :coordinate
      t.string :name
      t.string :place_type

      t.timestamps
    end
  end
end
