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
end
