require 'rails_helper'

RSpec.describe 'hospitals/index', type: :view do
  before(:each) do
    assign(:hospitals, [
      Hospital.create!(
        name: 'Name'
      ),
      Hospital.create!(
        name: 'Name 2'
      )
    ])
  end

  it 'renders a list of hospitals' do
    render
    assert_select 'a', text: 'Name'.to_s, count: 1
    assert_select 'a', text: 'Name 2'.to_s, count: 1
    assert_select 'td', count: 2
  end
end
