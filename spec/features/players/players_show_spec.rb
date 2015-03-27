describe "players show" do

  before(:each) { Player.create(first_name: 'John', last_name: 'Doe') }

  it "shows player profile" do 
    visit '/players'
    click_link 'John Doe'
    expect(page).to have_content 'John Doe'
  end
end
