# frozen_string_literal: true

# class with option for test instance
class InstanceOptions
  attr_accessor :browser, :device

  def initialize
    @browser = fetch_browser
    @device = :desktop_linux
  end

  def fetch_browser
    browser_env = ENV.fetch('SPEC_BROWSER', :chrome)
    return :chrome if browser_env.empty?

    browser_env.to_sym
  end
end
