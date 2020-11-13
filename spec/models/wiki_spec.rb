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

  describe "with_readings_of" do
    before(:each) do
      @wiki.name = "Test"
      @wiki.save
      @wiki.readingtimes << Readingtime.create << Readingtime.create
    end

    it "returns the wiki with a list of its readings" do
      wiki = Wiki.with_readings_of(@wiki.id)

      expect(wiki[:readings]).not_to be_nil
      expect(wiki[:readings].size).to be(2)
    end

    it "returns nil if no ID is found" do
      wiki = Wiki.with_readings_of(420)

      expect(wiki).to be_nil
    end
  end
end
