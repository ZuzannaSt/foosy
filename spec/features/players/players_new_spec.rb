describe "new player" do

  def set_valid_params
    fill_in :player_first_name, with: 'Suzanne'
    fill_in :player_last_name, with: 'Moose'
    attach_file :player_avatar, File.join(Rails.root, '/app/assets/images/flat_avatars/suzanne.png')
  end

  def visit_expect_set
    visit '/players/new'
    expect(page).to have_content 'Create player'
    set_valid_params
  end

  it "generates new player form" do
    visit '/players/new'
    expect(page).to have_content 'Create player'
  end

  it "creates new player" do 
    visit_expect_set
    click_button 'Create Player'
    expect(page).to have_content 'Suzanne Moose'
  end

  it "can't create player without params" do 
    visit '/players/new'
    click_button 'Create Player'
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end

  it "should have first_name" do 
    visit_expect_set
    fill_in :player_first_name, with: nil
    click_button 'Create Player'
    expect(page).to have_content "First name can't be blank"
  end

  it "should have last_name" do 
    visit_expect_set
    fill_in :player_last_name, with: nil
    click_button 'Create Player'
    expect(page).to have_content "Last name can't be blank"
  end

  it "first_name should have min 2 letters" do
    visit_expect_set
    fill_in :player_first_name, with: 'S'
    click_button 'Create Player'
    expect(page).to have_content "First name minimum 2 letters"
  end

  it "last_name should have min 2 letters" do
    visit_expect_set
    fill_in :player_last_name, with: 'M'
    click_button 'Create Player'
    expect(page).to have_content "Last name minimum 2 letters"
  end

  it "first_name should allow only letters" do
    visit_expect_set
    fill_in :player_first_name, with: '4'
    click_button 'Create Player'
    expect(page).to have_content "First name only allows letters"
  end

  it "last_name should allow only letters" do
    visit_expect_set
    fill_in :player_last_name, with: '!'
    click_button 'Create Player'
    expect(page).to have_content "Last name only allows letters"
  end
end
