require 'spec_helper'

describe WebPurify::TextFilters, "#check", vcr: true do
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

describe WebPurify::TextFilters, "#check_count", vcr: true do
  let(:client) { WebPurify::Client.new(ENV["WEBPURIFY_API_KEY"]) }
  subject { client.check_count(text) }

  context "no profanities" do
    let(:text) { "safe text" }

    it "returns 0" do
      expect(subject).to eq(0)
    end
  end

  context "one profanity" do
    let(:text) { "text with damn" }

    it "returns 1" do
      expect(subject).to eq(1)
    end
  end

  context "two profanities" do
    let(:text) { "text with damn and hell" }

    it "returns 2" do
      expect(subject).to eq(2)
    end
  end

end

describe WebPurify::TextFilters, "#replace", vcr: true do
  let(:client) { WebPurify::Client.new(ENV["WEBPURIFY_API_KEY"]) }
  subject { client.replace(text, "*") }

  context "safe text" do
    let(:text) { "safe text" }

    it "returns the text with no changes" do
      expect(subject).to eq(text)
    end
  end

  context "text with profanity" do
    let(:text) { "text with damn and hell" }

    it "returns the text with profanities replaced by symbols" do
      expect(subject).to eq("text with **** and ****")
    end
  end

end

describe WebPurify::TextFilters, "#return", vcr: true do
  let(:client) { WebPurify::Client.new(ENV["WEBPURIFY_API_KEY"]) }
  subject { client.return(text) }

  context "no profanities" do
    let(:text) { "safe text" }

    it "returns an empty array" do
      expect(subject).to eq([])
    end
  end

  context "one profanity" do
    let(:text) { "text with damn" }

    it "returns an array with one profanity" do
      expect(subject).to eq(["damn"])
    end
  end

  context "two profanities" do
    let(:text) { "text with damn and hell" }

    it "returns an array with two profanities" do
      expect(subject).to contain_exactly("damn", "hell")
    end
  end

end