class UpdateEventsColumns < ActiveRecord::Migration
  def change
    add_column :events, :source_id, :integer, null: false
    change_column :events, :name, :string, null: false
    change_column :events, :location, :string, limit: 60
    change_column :events, :description, :text, limit: 500
    change_column :events, :href, :string, null: false
  end
end
