require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "Name",
      :location => "Location",
      :description => "MyText",
      :href => "Href",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Href/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
  end
end
