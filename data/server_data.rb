# frozen_string_literal: true

# Class for Portal Data
class ServerData
  def self.address(version)

    return ENV['CUSTOM_URL'] if ENV['CUSTOM_URL']

    servers = {
      develop: 'https://isa2.teamlab.info/',
      kim: 'https://kim.teamlab.info/',
      doclinux: 'https://doc-linux.teamlab.info/'
    }

    servers[version.to_sym]
  end
end
