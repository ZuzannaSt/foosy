describe "matches index" do

  it "shows matches list" do 
    visit '/matches'
    expect(page).to have_content 'Matches'
  end
end
