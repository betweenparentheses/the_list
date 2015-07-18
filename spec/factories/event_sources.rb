FactoryGirl.define do
  factory :event_source do
    sequence :name do |n|
      "Internet Place \##{n}"
    end
  end
end
