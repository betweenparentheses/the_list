class Event < ActiveRecord::Base

  belongs_to :source, foreign_key: :source_id, class_name: "EventSource"

  validates_presence_of :source, :name
  validates_uniqueness_of :name

  geocoded_by :location
  after_validation :geocode,
  :if => ->(obj){  obj.location.present? && obj.location_changed? }



end
