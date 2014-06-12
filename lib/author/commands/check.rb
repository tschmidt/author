# Encoding: UTF-8
require 'thor'
require 'english'

module Author
  module Commands
    # = Author::Commands::Check
    #
    # Set of actions to check for system dependencies. These are packages
    # that are needed to build .mobi and PDF files.
    #
    class Check < Thor::Group
      def check_for_prince
        check_for 'Prince'
      end

      def check_for_kindlegen
        check_for 'KindleGen'
      end

      private

      def check_for(dependency)
        command = dependency.downcase
        installed = (`which #{command}` && $CHILD_STATUS.success?)
        color = installed ? :green : :red
        say "Checking for #{dependency}"
        say "#{dependency} is#{' not' unless installed} installed\n\n", color
      end
    end
  end
end
