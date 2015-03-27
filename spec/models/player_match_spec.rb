describe PlayerMatch do

  before(:each) { @player_match = build(:player_match_one) }

  subject { @player_match }

  it { should respond_to(:result) }
  it { should be_valid } 
  
   it "should update #result" do
    @player_match.result = nil
    expect { @player_match.set_result }.to change(@player_match, :result).from(nil).to(0)
  end

  it "#result should be numerical" do
    @player_match.result = 123
    expect(@player_match).to be_valid
  end

end
