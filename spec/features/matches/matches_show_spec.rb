describe "matches show" do

  def set_visit_expect
    create_match
    visit '/matches'
    click_link 'match_date'
    expect(page).to have_content 'John Doe'
  end

  it "shows match" do
    set_visit_expect
  end

  it "first player scores a goal", js: true do
    set_visit_expect
    click_button :first_player_goal
    expect(page).to have_content 'Goal for the first player!'
  end

  it "second player scores a goal", js: true do
    set_visit_expect
    click_button :second_player_goal
    expect(page).to have_content 'Goal for the second player!'
  end

  it "first player won", js: true do
    set_visit_expect
    10.times{ click_button :first_player_goal }
    expect(page).to have_selector "#first-won"
    expect(page).to have_selector "#second-lost"
    expect(page).not_to have_button :second_player_goal
  end

  it "second player won", js: true do
    set_visit_expect
    10.times{ click_button :second_player_goal }
    expect(page).to have_selector "#second-won"
    expect(page).to have_selector "#first-lost"
    expect(page).not_to have_button :second_player_goal
  end

  it "has a WINNER and looser badges", js: true do
    set_visit_expect
    10.times{ click_button :first_player_goal }
    expect(page).to have_content "WINNER"
    expect(page).to have_content "looser"
  end
end
