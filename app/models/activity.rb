class Activity < ActiveRecord::Base

  #ASSOCIATIONS
  belongs_to :category


  # VALIDATIONS
  validates_presence_of :category, :name

  # can't validate presence because false isn't present
  validates :done, :inclusion => {:in => [true, false]}

  validates_uniqueness_of :name



  # GEOCODER GEM

  geocoded_by :location
  after_validation :geocode,
  :if => ->(obj){ obj.location_changed? }




end
