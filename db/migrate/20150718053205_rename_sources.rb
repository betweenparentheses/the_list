class RenameSources < ActiveRecord::Migration
  def change
    rename_table :listing_sources, :event_sources
  end
end
