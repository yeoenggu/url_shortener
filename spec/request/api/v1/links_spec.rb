require "spec_helper"
require "rails_helper"


RSpec.describe "Link API", type: :request do
  let(:link) { FactoryBot.create(:link) }

  subject { 
  	get "/api/v1/linkstats", params: {id: link.id} 
  	response
  }

  it "get stats of a link" do
  	json = JSON.parse(subject.body)
    expect(json['clicks']).to eq(link.clicks)
  end
end
