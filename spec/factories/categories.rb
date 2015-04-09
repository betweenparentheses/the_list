FactoryGirl.define do
  factory :category do
    sequence :name do |n|
      "category#{n}"
    end
  end

end
