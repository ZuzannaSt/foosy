describe Match do

  before(:each) { @match = build(:match) }  

  subject { @match }

  it { should respond_to(:date) }
  it { should be_valid }

  it { should have_many(:player_matches) }
  it { should have_many(:players).through(:player_matches) }

end
