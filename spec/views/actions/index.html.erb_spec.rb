require 'rails_helper'

RSpec.describe "actions/index", type: :view do
  before(:each) do
    assign(:actions, [
      Action.create!(
        name: "Name",
        result: "Result",
        type: 2
      ),
      Action.create!(
        name: "Name",
        result: "Result",
        type: 2
      )
    ])
  end

  it "renders a list of actions" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Result".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
