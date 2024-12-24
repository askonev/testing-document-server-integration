# frozen_string_literal: true

require_relative '../spec_helper'

describe 'Name of suite' do
  starter = ServerParameters.new(suite: description,
                                 count_of_users: 4)

  it 'ServerParameters properties' do
    expect(starter.name_of_suite).to eq('Name of suite')
    expect(starter.jwt_key).to eq('secret')
    expect(starter.language).to eq('en-US')
    expect(starter.document_type.to_s).to eq('document')
    expect(starter.doc_server_base_url).to eq('https://doc-linux.teamlab.info/')
  end
end
