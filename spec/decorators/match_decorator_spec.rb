require 'spec_helper'

describe MatchDecorator do
  let(:match) { described_class.new(build(:match)) }

  describe "#long date" do
    it "links to match" do
      expect(match.long_date).to have_css("a#match_date")
    end
  end
end
