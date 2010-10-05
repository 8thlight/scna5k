class ChangeTimeColumnToString < ActiveRecord::Migration
  def self.up
    change_column :runners, :time, :string
  end

  def self.down
    change_column :runners, :time, :decimal, :precision => 8, :scale => 2
  end
end
