require 'spec_helper'

describe PlayerDecorator do

  it "full name should link to John Doe" do
    player =  build(:player_one).decorate
    expect(player.full_name).to eq('<a href="/players">John Doe</a>')
  end
end
