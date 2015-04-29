require 'spec_helper'

describe WebPurify::ImageFilters, "#imgcheck", vcr: true do
  let(:client) { WebPurify::Client.new(api_key: ENV["WEBPURIFY_API_KEY"], service: :image) }
  let(:imgurl) { "http://www.example.com/test.jpg" }
  subject { client.imgcheck(imgurl) }

  it "returns an image ID" do
    expect(subject).to be_instance_of(String)
  end

end

describe WebPurify::ImageFilters, "#imgstatus", vcr: true do
  let(:client) { WebPurify::Client.new(api_key: ENV["WEBPURIFY_API_KEY"], service: :image) }
  let(:imgurl) { "http://www.example.com/test.jpg" }
  let(:imgid) { client.imgcheck(imgurl) }
  subject { client.imgstatus(imgid) }

  it "returns the status of image moderation" do
    expect(subject).to eq("pending")
  end

end

describe WebPurify::ImageFilters, "#imgaccount", vcr: true do
  let(:client) { WebPurify::Client.new(api_key: ENV["WEBPURIFY_API_KEY"], service: :image) }
  subject { client.imgaccount }

  it "returns the number of image submissions remaining" do
    expect(subject).to be_kind_of(Integer)
  end

end