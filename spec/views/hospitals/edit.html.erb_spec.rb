require 'rails_helper'

RSpec.describe "hospitals/edit", type: :view do
  before(:each) do
    @hospital = assign(:hospital, Hospital.create!(
      name: "MyString"
    ))
  end

  it "renders the edit hospital form" do
    render

    assert_select "form[action=?][method=?]", hospital_path(@hospital), "post" do

      assert_select "input[name=?]", "hospital[name]"
    end
  end
end
