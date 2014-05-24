require 'thor'
require_relative 'version'

module Author
  module Commands
    class Cli < Thor
      
      register Author::Commands::Version, 'version', 'version', 'Display current version'
      map %w[-v --version] => :version
      
    end
  end
end