class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :description, :date, :href, :latitude, :longitude, :time
end
