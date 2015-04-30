describe "new match" do

  def set_and_visit
    @player_one = create(:player_one)
    @player_two = create(:player_two)
    visit '/matches/new'
  end

  it "generates new match form" do
    visit '/matches/new'
    expect(page).to have_content 'Create match'
  end

  it "alerts to choose two players", js: true do
    set_and_visit
    click_button :matchSubmit
    expect(page).to have_content 'Remember that you must choose two players to start a game.'
  end
end
