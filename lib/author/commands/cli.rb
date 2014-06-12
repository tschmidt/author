# Encoding: UTF-8
require 'thor'
require_relative 'version'
require_relative 'check'
require_relative 'generator'

module Author
  module Commands
    # = Author::Commands::Cli
    #
    # Main class for author binary. This will allow the user to run
    # a list of commands using the `author` command.
    #
    # == Usage
    #
    # From the command line:
    #
    #    author help
    #    author version (-v, --version)
    #    author check
    #    author build [xhtml, pdf, epub, mobi]
    #    author new <book-title>
    #
    class Cli < Thor

      register Author::Commands::Version, 'version', 'version', 'Display current version'
      map %w[-v --version] => :version

      register Author::Commands::Check, 'check', 'check', 'Check that all dependencies are installed'
      register Author::Commands::Generator, 'new', 'new <book-name>', 'Create a new book project'

      register Author::Commands::Builder, 'build', 'build', 'Build the specified format'
    end
  end
end