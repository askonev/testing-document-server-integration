# frozen_string_literal: true

# class working with example data
class ExampleOperation
  include OnlyofficeWebdriverWrapper

  def initialize(instance)
    @instance = instance
  end

  # Init selenium session for example
  # @param [String] example_address address of example
  def init_session(example_address = @instance.user_data.integration_example_address)
    @instance.selenium = WebDriver.new(@instance.options.browser,
                                       device: @instance.options.device,
                                       record_video: false)
    @instance.selenium.open(example_address)
    @instance.doc_service_welcome.go_to_example
  end
end
