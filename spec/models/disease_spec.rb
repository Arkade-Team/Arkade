require 'rails_helper'

RSpec.describe Disease, type: :model do
  before(:each) do
    Disease.delete_all
    @disease = Disease.new
  end

  it "fails to create without name" do
    expect(@disease).not_to be_valid
  end

  it "fails to create duplicated name" do
    dup_name = "Foo"
    Disease.create(name: dup_name)
    @disease.name = dup_name
    expect(@disease).not_to be_valid
  end

  it "fails to create names that are too short" do
    @disease.name = "a"
    expect(@disease).not_to be_valid
  end
end
