# frozen_string_literal: true

require_relative 'server_data'

# class with server data for running tests
class ServerParameters
  attr_accessor :name_of_suite,
                :document_type

  attr_reader :doc_server_base_url,
              :count_of_users,
              :jwt_key,
              :language

  def initialize(params = {})
    @name_of_suite = params.fetch(:suite, '')
    @document_type = ServerParameters.document_type
    @doc_server_base_url = params.fetch(:doc_server_base_url, ServerData.address('doclinux'))
    @count_of_users = params.fetch(:count_of_users, 1)
    @jwt_key = params.fetch(:jwt_key, 'secret')
    @language = params.fetch(:language, 'en-US')
  end

  # Default document type for test
  # @return [Symbol] type of document
  def self.document_type
    spec_relative_path = ARGV.first.gsub("#{Dir.pwd}/", '')
    return :document if spec_relative_path.include?('documents')
    return :spreadsheet if spec_relative_path.include?('spreadsheets')
    return :presentation if spec_relative_path.include?('presentations')
    return :form if spec_relative_path.include?('forms')

    :document
  end
end
