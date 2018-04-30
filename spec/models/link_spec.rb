require "spec_helper"
require "rails_helper"

RSpec.describe Link, :type => :model do
  it "is not valid without a full_url" do
    link = Link.create(full_url: nil)
    expect(link).to_not be_valid
  end

  it "is not valid without a valid formatted full_url" do
    link = Link.create(full_url: "httpx://asdf.qwerty")
    expect(link).to_not be_valid
  end

  it "is valid with a valid formatted full_url" do
    link = Link.create(full_url: "https://www.facebook.com")
    link.generate_slug
    expect(link).to be_valid
  end

  it "has a default access count of 0" do
    link = Link.create(full_url: "https://www.facebook.com")
    link.generate_slug
    expect(link.clicks).to eq(0)
  end

  it "increments access count each time it is viewed" do
    link = Link.create(full_url: "https://www.facebook.com")
    link.generate_slug
    3.times { link.clicked }
    expect(link.clicks).to eq(3)
  end
end
