class AddDefaultFalseToDoneInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :done, :boolean, null: false, default: false
  end
end
