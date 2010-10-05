class CreateRunners < ActiveRecord::Migration
  def self.up
    create_table :runners do |t|
      t.string :name
      t.integer :number
      t.decimal :time, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :runners
  end
end
