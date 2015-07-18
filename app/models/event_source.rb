class EventSource < ActiveRecord::Base
  has_many :events, foreign_key: :source_id

  validates_presence_of :name
end
