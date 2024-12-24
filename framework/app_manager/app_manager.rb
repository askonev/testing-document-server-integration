# frozen_string_literal: true

require 'onlyoffice_file_helper'
require 'onlyoffice_webdriver_wrapper'

require_relative '../../data/server_parameters'
require_relative '../../data/test_data/test_data'
require_relative '../test_instance_docs'

# class representing the entry point for the configuration of the test environment
class AppManager

  # @return [Array, Users] store an array of initialized users
  attr_accessor :users

  class << self
    # @param [Object] starter
    # @param [Object] user_data_array
    # @return [Array]
    def init_users(starter, user_data_array)
      users_array = []
      trimmed_user_data = user_data_array[0..starter.count_of_users - 1]
      trimmed_user_data.each do |user_data|
        user_data.integration_example_address = starter.doc_server_base_url
        user = OnlyofficeDocumentserverTestingFramework::TestInstanceDocs.new(user_data)
        user.starter = starter
        users_array << user
        OnlyofficeLoggerHelper.log("Initialized user data: #{user.user_data.full_name} ")
      end
      users_array
    end

    def test_example_users(starter)
      @users = init_users(starter, TestData.users)
    end

    def test_completion_actions(example, users)
      p example
      users.each { |cur_user| cur_user.selenium&.quit }
      OnlyofficeWebdriverWrapper::WebDriver.clean_up
      # users.each do |cur_user|
      #   cur_user.example_operation.delete_created_files
      #   cur_user.example_operation.delete_created_folders
      # end
    end
  end
end
