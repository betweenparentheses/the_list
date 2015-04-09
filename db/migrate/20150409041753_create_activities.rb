class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :category, null: false
      t.string :name, null: false
      t.string :location

      t.date :expiration_date
      t.text :description

      t.float :latitude
      t.float :longitude
      t.boolean :done, null: false
      t.timestamps
    end
    add_index :activities, :name, unique: true
  end
end
