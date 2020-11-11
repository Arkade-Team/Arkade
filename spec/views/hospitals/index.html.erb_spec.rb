require 'rails_helper'

RSpec.describe "hospitals/index", type: :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        name: "Name"
      ),
      Hospital.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of hospitals" do
    render
    assert_select "tr>td", text: "Nome".to_s, count: 1
    assert_select "row", count: 1
  end
end
