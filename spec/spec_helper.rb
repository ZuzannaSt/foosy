require 'capybara/rspec'
require 'capybara/webkit/matchers'
Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include(Capybara::Webkit::RspecMatchers, :type => :feature)

  config.before :each, :js, type: :feature do |example|
  if example.metadata[:js]
    page.driver.allow_url("http://www.google.com/jsapi")
    page.driver.block_unknown_urls
  end
end

  def create_match
    @match = Match.create(date: Time.now)
    @p1 = Player.create(first_name: 'John', last_name: 'Doe')
    @p2 = Player.create(first_name: 'Jane', last_name: 'Don')
    @match.players = [@p1, @p2]
    @match.save
  end

end
