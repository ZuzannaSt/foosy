require 'spec_helper'

describe PlayerDecorator do
  let(:player) { described_class.new(build(:player_one)) }

  describe "#fullname" do
    it "displays user fullname" do
      expect(player.full_name).to eq('John Doe')
    end
  end

  describe "#link_to_full_name" do
    it "links to user" do
      expect(player.link_to_full_name).to eq('<a href="/players">John Doe</a>')
    end
  end

  describe '#winner' do
    it 'displays WINNER message' do
      expect(player.winner).to eq 'WINNER'
    end
  end

  describe '#looser' do
    it 'displays LOOSER message' do
      expect(player.looser).to eq 'looser'
    end
  end
end
