# frozen_string_literal: true

require_relative '../spec_helper'

describe 'AppManager units' do
  starter = ServerParameters.new(suite: description,
                                 count_of_users: 4)

  users = AppManager.test_example_users(starter)

  before do
    users[0].example_operation.init_session
  end

  after do |example|
    AppManager.test_completion_actions(example, users)
  end

  describe 'Users' do
    it 'John Smith' do
      expect(users).to be_a(Array)
      name, surname = RSpec.current_example.description.split(' ')
      expect(users[0].user_data.first_name).to eq(name)
      expect(users[0].user_data.second_name).to eq(surname)
    end

    it 'Mark Pottato' do
      name, surname = RSpec.current_example.description.split(' ')
      expect(users[1].user_data.first_name).to eq(name)
      expect(users[1].user_data.second_name).to eq(surname)
    end

    it 'Hamish Mitchell ' do
      name, surname = RSpec.current_example.description.split(' ')
      expect(users[2].user_data.first_name).to eq(name)
      expect(users[2].user_data.second_name).to eq(surname)
    end

    it 'Anonymous' do
      expect(users).to be_a(Array)
      name = RSpec.current_example.description
      expect(users[3].user_data.first_name).to eq(name.to_s)
      expect(users[3].user_data.second_name).to eq('')
    end
  end
end
