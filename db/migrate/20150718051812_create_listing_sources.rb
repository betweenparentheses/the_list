class CreateListingSources < ActiveRecord::Migration
  def change
    create_table :listing_sources do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
