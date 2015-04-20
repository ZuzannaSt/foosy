require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def create_match
    @match = Match.create(date: Time.now)
    @p1 = Player.create(first_name: 'John', last_name: 'Doe')
    @p2 = Player.create(first_name: 'Jane', last_name: 'Don')
    @match.players = [@p1, @p2]
    @match.save
  end

end
