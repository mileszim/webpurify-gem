require 'spec_helper'

describe WebPurify::Filters, "#check", vcr: true do
  let(:client) { WebPurify::Client.new(ENV["WEBPURIFY_API_KEY"]) }
  let(:options) { {} }
  subject { client.check(text, options) }

  context "safe text" do
    let(:text) { "safe text" }

    it "returns false" do
      expect(subject).to eq(false)
    end
  end

  context "text with profanity" do
    let(:text) { "text with damn" }

    it "returns true" do
      expect(subject).to eq(true)
    end
  end

  context "text with an email" do
    let(:text) { "text with name@example.com"}

    it "returns false by default" do
      expect(subject).to eq(false)
    end

    context "when emails are prohibited" do
      let(:options) { { semail: 1 } }

      it "returns true" do
        expect(subject).to eq(true)
      end
    end
  end

  context "text with a phone number" do
    let(:text) { "text with 555-555-5555" }

    it "returns false by default" do
      expect(subject).to eq(false)
    end

    context "when phone numbers are prohibited" do
      let(:options) { { sphone: 1 } }

      it "returns true" do
        expect(subject).to eq(true)
      end
    end
  end

  context "text with a URL" do
    let(:text) { "text with www.example.com" }

    it "returns false by default" do
      expect(subject).to eq(false)
    end

    context "when URLs are prohibited" do
      let(:options) { { slink: 1 } }

      it "returns true" do
        expect(subject).to eq(true)
      end
    end
  end

end