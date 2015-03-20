describe Player do

  before(:each) { @player = build(:player_one) }  

  subject { @player }

  it { should respond_to(:first_name) }

  it { should respond_to(:last_name) }

  it { should be_valid }

  it "checks if players first name is John" do
    expect(@player.first_name).to eq('John')
  end

  it "checks if players last name is Doe" do
    expect(@player.last_name).to eq('Doe')
  end

end
