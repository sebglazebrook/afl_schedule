require 'afl/version'
require 'afl/schedule'
require 'afl/season'
require 'afl/fixture_importer'

module AFL

  def self.root
    File.expand_path '../..', __FILE__
  end

end
