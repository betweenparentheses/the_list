FactoryGirl.define do
  factory :activity do

    sequence :name do |n|
      "Activity Number #{n}"
    end

    done false
    description "bababadhal gharagh takkaminnaronn konnbronn tonneronn tuonn thunn trovarhounn awnskawn toohoohoor denenthurnuk"
    location "The New Parkway Theatre"


    association :category
  end

end
