class CreateRunners < ActiveRecord::Migration
  def change
    create_table :runners do |t|
      t.string :name
      t.integer :number
      t.float :time

      t.timestamps
    end
  end
end
