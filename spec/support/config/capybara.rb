RSpec.configure do |config|
  config.before(:each, type: :system) do
    Capybara.register_driver :chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new

      Capybara::Selenium::Driver.new(
        app,
        options:,
        browser: :chrome,
      )
    end

    Capybara.register_driver :headless_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')

      Capybara::Selenium::Driver.new(
        app,
        options:,
        browser: :chrome,
      )
    end

    driven_by(ENV['RUNNER'] == 'CI' ? :headless_chrome : :chrome)

    Capybara.configure do |config|
      # Match what's set for URL options in test.rb
      # so we can test mailers that contain links.
      config.server_host = 'localhost'
      config.server_port = ENV.fetch("CAPYBARA_SERVER_PORT") { 12000 }
    end
  end
end
