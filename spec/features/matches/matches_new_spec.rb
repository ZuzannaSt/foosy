describe "new match" do

  it "generates new match form" do
    visit '/matches/new'
    expect(page).to have_content 'Create match'
  end

end
