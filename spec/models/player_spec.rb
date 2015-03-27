describe Player do

  before(:each) { @player = build(:player_one) } 

  subject { @player }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should be_valid }

  it "should have #first_name" do
    @player.first_name = nil
    expect(@player).to_not be_valid
  end

  it "should have #last_name" do
    @player.last_name = nil
    expect(@player).to_not be_valid
  end

  it "should not have short name" do
    @player.first_name = "O"
    expect(@player).to_not be_valid
  end

  it "should allow only letters in name" do
    @player.first_name = "666"
    expect(@player).to_not be_valid
  end

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
end
