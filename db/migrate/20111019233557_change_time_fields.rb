class ChangeTimeFields < ActiveRecord::Migration
  def up
    remove_column :runners, :time
    add_column :runners, :minutes, :integer
    add_column :runners, :seconds, :float
  end

  def down
    add_column :runners, :time, :float
    remove_column :runners, :minutes
    remove_column :runners, :seconds
  end
end
