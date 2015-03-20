describe Match do

  before(:each) { @match = build(:match) }  

  subject { @match }

  it { should respond_to(:date) }
  it { should be_valid }

end
