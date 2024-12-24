# frozen_string_literal: true

require 'spec_helper'

describe '[Smoke] Test Example' do
  starter = ServerParameters.new(suite: description)

  users = AppManager.test_example_users(starter)

  before do
    users[0].example_operation.init_session
  end

  after do |example|
    AppManager.test_completion_actions(example, users)
  end

  describe 'Sample documents add files in list' do
    it 'Sample documents add files in list' do
      list_before_upload = users[0].doc_test_functions.uploaded_file_list
      users[0].doc_test_functions.create_a_file_with_sample.check
      users[0].doc_test_functions.open_sample_document(:document)
      # users[0].example_operation.go_to_list_of_files
      list_after_upload = users[0].doc_test_functions.uploaded_file_list
      diff_files = list_after_upload - list_before_upload
      expect(diff_files.length).to eq(1)
      expect(diff_files.first.file_name).to include('sample')
      expect(diff_files.first.file_name).to include('docx')
    end

    it 'Sample spreadsheet add files in list' do
      list_before_upload = users[0].doc_test_functions.uploaded_file_list
      users[0].doc_test_functions.create_a_file_with_sample.check
      users[0].doc_test_functions.open_sample_document(:spreadsheet)
      users[0].portal_operation.go_to_list_of_files
      list_after_upload = users[0].doc_test_functions.uploaded_file_list
      diff_files = list_after_upload - list_before_upload
      expect(diff_files.length).to eq(1)
      expect(diff_files.first.file_name).to include('sample')
      expect(diff_files.first.file_name).to include('xlsx')
    end

    it 'Sample presentation add files in list' do
      list_before_upload = users[0].doc_test_functions.uploaded_file_list
      users[0].doc_test_functions.create_a_file_with_sample.check
      users[0].doc_test_functions.open_sample_document(:presentation)
      users[0].portal_operation.go_to_list_of_files
      list_after_upload = users[0].doc_test_functions.uploaded_file_list
      diff_files = list_after_upload - list_before_upload
      expect(diff_files.length).to eq(1)
      expect(diff_files.first.file_name).to include('sample')
      expect(diff_files.first.file_name).to include('pptx')
    end
  end
end
