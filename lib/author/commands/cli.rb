require 'thor'
require_relative 'version'
require_relative 'check'
require_relative 'generator'

module Author
  module Commands
    class Cli < Thor
      
      register Author::Commands::Version, 'version', 'version', 'Display current version'
      map %w[-v --version] => :version
      
      register Author::Commands::Check, 'check', 'check', 'Check that all dependencies are installed'
      register Author::Commands::Generator, 'new', 'new <book-name>', 'Create a new book project'
      
      register Author::Commands::Builder, 'build', 'build', 'Build the specified format'
      
    end
  end
end