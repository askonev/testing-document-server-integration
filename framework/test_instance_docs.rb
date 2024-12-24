# frozen_string_literal: true

require 'onlyoffice_documentserver_testing_framework'
require_relative 'examples/example_operation'
require_relative 'instance_options'

module OnlyofficeDocumentserverTestingFramework
  # main class of project, all test instances is that
  class TestInstanceDocs
    attr_accessor :user_data,
                  :starter,
                  :options

    # @param [Object] user
    # @return [Object]
    def initialize(user)
      @user_data = user
      @options = InstanceOptions.new
    end

    def example_operation
      ExampleOperation.new(self)
    end
  end
end
