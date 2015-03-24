describe PlayerMatch do

  before(:each) { @player_match = build(:player_match_one) }

  subject { @player_match }

  it { should respond_to(:result) }
  it { should be_valid } 

  it "should have #result" do
    @player_match.result = nil
    expect(@player_match).to_not be_valid
  end

  it "#result should be numerical" do
    @player_match.result = "Meh"
    expect(@player_match).to_not be_valid
  end
end
