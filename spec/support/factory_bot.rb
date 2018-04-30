require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      # Test factories in spec/factories are working.
      # FactoryBot.find_definitions
      # FactoryBot.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

