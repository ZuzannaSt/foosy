describe "players index" do

  it "shows players list" do 
    visit '/players'
    expect(page).to have_content 'Players'
  end
end
