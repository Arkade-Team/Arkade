require 'rails_helper'

RSpec.describe Wiki, type: :model do
  before(:each) do
    @wiki = Wiki.new
  end

  it "fails to create with empty name" do
    @wiki.name = ""

    expect(@wiki).not_to be_valid
  end

  it "fails to create without name" do
    expect(@wiki).not_to be_valid
  end

  it "fails to create with doubled name" do
    repeated_name = "Foo"
    Wiki.create(name: repeated_name)

    @wiki.name = repeated_name

    expect(@wiki).not_to be_valid
  end
end
