require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :href => "Href",
        :latitude => 1.5,
        :longitude => 1.5
      ),
      Event.create!(
        :name => "Name",
        :location => "Location",
        :description => "MyText",
        :href => "Href",
        :latitude => 1.5,
        :longitude => 1.5
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Href".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
