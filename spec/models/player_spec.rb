describe Player do

  before(:each) { @player = build(:player_one) }  

  subject { @player }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should be_valid }

  it { should have_many(:player_matches) }
  it { should have_many(:matches).through(:player_matches) }

  it "first name should be John" do
    expect(@player.first_name).to eq('John')
  end

  it "last name should be Doe" do
    expect(@player.last_name).to eq('Doe')
  end

  it "full name should be John Doe" do
    expect(@player.full_name).to eq('John Doe')
  end

  before(:each) { @match = build(:match) }
  before(:each) { @player.matches = [@match] }

  it "should return score" do
    expect(@player.score).to eq(0)
  end
  
  it "should score a goal" do
    @player.goal!
    expect(@player.score).to eq(1)
  end

  it "should win the game" do
    10.times{ @player.goal! }
    expect(@player.has_won?).to eq(true)
  end
end
