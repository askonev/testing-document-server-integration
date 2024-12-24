# frozen_string_literal: true

# class for user data
class UserData
  attr_accessor :first_name,
                :second_name

  attr_writer :integration_example_address

  def initialize(first_name, params = {})
    @first_name = first_name
    @second_name = params.fetch(:second_name, '')
    @integration_example_address = params.fetch(:integration_example_address, nil)
  end

  def full_name
    "#{@first_name} #{@second_name}"
  end

  # @return [String] url of integration_example_address with always `/` at end
  def integration_example_address
    # Check if the value is not a String
    unless @integration_example_address.is_a?(String)
      raise ArgumentError,
            "Expected a String, got #{@integration_example_address.class}"
    end

    return @integration_example_address if @integration_example_address.end_with?('/')

    "#{@integration_example_address}/"
  end
end
