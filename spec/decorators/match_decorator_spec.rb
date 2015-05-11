require 'spec_helper'

describe MatchDecorator do
  it "long_date should link to match" do
    match =  build(:match).decorate
    expect(match.long_date).to include('<a href="/matches">')
  end
end
