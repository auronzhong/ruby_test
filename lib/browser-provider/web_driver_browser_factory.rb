require 'watir-webdriver'


module Watir
  class Browser
    def url
      if @driver.title == "Certificate Error: Navigation Blocked"
        goto("javascript:document.getElementById('overridelink').click()")
      end
      @driver.current_url
    end
  end
end
class WebDriverBrowserFactory
  def initialize(args)
    @browser = args[:browser].intern
  end

  def get_browser_instance

    if @browser == :firefox
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile.assume_untrusted_certificate_issuer = true
      @b = Watir::Browser.new :firefox, :profile => profile


      return @b
    elsif @browser == :chrome
      puts "elsif @browser == :chrome"
      # profile = Selenium::WebDriver::Chrome;;Profile.new
      # download_directory = File.dirname(__FILE__)+ "/../../lib/file-download"
      # profile['download_prompt_for_download'] = false
      # profile['download_default_directory'] = download_directory.gsub("/","\\")
      # @b = Watir::Browser.new :chrome, :profile => profile, :switches => %w[--ignore-certificate-errors --disable-application-cache]
      @b = Watir::Browser.new :chrome
      return @b
    elsif @browser == :ie
      puts "ie"
      @b = Watir::Browser.new :ie
      return @b
    end

  end

end