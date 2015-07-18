require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :name => "MyString",
      :location => "MyString",
      :description => "MyText",
      :href => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_name[name=?]", "event[name]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "textarea#event_description[name=?]", "event[description]"

      assert_select "input#event_href[name=?]", "event[href]"

      assert_select "input#event_latitude[name=?]", "event[latitude]"

      assert_select "input#event_longitude[name=?]", "event[longitude]"
    end
  end
end
