# HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 } | tail -n 1'`.strip
# CHROMEDRIVER_URL = "https://#{HOST}:9515/"

RSpec.configure do |config|
  config.before(:each, type: :system) do

    # We should set it by default
    driven_by :chrome
    Capybara.register_driver :chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new

      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        options: options
      )
    end

    # We should set it to run on ci/cd pipelines
    # driven_by :headless_chrome
    Capybara.register_driver :headless_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--headless')

      Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        options: options
      )
    end

=begin
    # May be, We should set it to run on ci/cd pipelines
    # driven_by :selenium_remote_chrome
    Capybara.register_driver :selenium_remote_chrome do |app|
      options = Selenium::WebDriver::Chrome::Options.new
      options.add_argument('--start-maximized')

      Capybara::Selenium::Driver.new(
        app,
        browser: :remote,
        url: CHROMEDRIVER_URL,
        options: options
      )
    end
=end

    Capybara.configure do |config|
      # Match what's set for URL options in test.rb
      # so we can test mailers that contain links.
      config.server_host = 'localhost'
      config.server_port = '3000'
    end
  end
end
