describe Match do

  before(:each) { @match = build(:match) }  

  subject { @match }

  it { should respond_to(:date) }
  it { should be_valid }

  it { should have_many(:player_matches) }
  it { should have_many(:players).through(:player_matches) }

  it "should be true when has two players" do
    @player_one = build(:player_one)
    @player_two = build(:player_two)
    @match.players = [@player_one, @player_two]

    expect(@match.has_two_players?).to eq(true)
  end

  it "should be false without players" do
    @match.players = []
    expect(@match.has_two_players?).to eq(false)
  end

  it "should update date on finish" do
    date = @match.date
    @match.finish
    updated_date = @match.date

    expect(updated_date).not_to eq(date)
  end

end
