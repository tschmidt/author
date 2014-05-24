require 'thor'
require_relative 'version'
require_relative 'check'

module Author
  module Commands
    class Cli < Thor
      
      register Author::Commands::Version, 'version', 'version', 'Display current version'
      map %w[-v --version] => :version
      
      register Author::Commands::Check, 'check', 'check', 'Check that all dependencies are installed'
      
    end
  end
end