class Event < ActiveRecord::Base

  belongs_to :source, foreign_key: :source_id, class_name: "EventSource"

  validates_presence_of :source, :name
  validates_uniqueness_of :name
end
