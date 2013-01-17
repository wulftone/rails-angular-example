class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :year, limit: 4
      t.string :model
      t.string :make

      t.timestamps
    end
  end
end
