class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :town
      t.string :zipcode
      t.float :lat
      t.float :lon

      t.timestamps null: false
    end
  end
end
