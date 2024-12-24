# frozen_string_literal: true

require_relative 'user_data'

# class for test data
class TestData
  class << self
    def users
      [
        UserData.new('John', second_name: 'Smith'),
        UserData.new('Mark', second_name: 'Pottato'),
        UserData.new('Hamish', second_name: 'Mitchell'),
        UserData.new('Anonymous')
      ]
    end
  end
end
