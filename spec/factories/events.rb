FactoryGirl.define do
  factory :event do
    sequence :name do |x|
      "blahhh#{x}"
    end

    href "http://cashcatz.biz"
    location "Los Angeles, CA"
    description "lorem ipsum dolor sit amet arma virumque cano troijae qui primus ab oris"
    association :source, factory: :event_source
  end

end
