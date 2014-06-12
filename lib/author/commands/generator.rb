# Encoding: UTF-8
require 'thor'

module Author
  module Commands
    # = Author::Commands::Generator
    #
    # Generates a new author project.
    #
    # == Usage
    #
    #    author new <book-title>
    #
    class Generator < Thor::Group
      include Thor::Actions

      argument :title

      def set_destination_root
        self.destination_root = File.join(destination_root, title)
      end

      def create_project_structure
        say "Creating directories for your new book, #{title}"
        empty_directory 'chapters'
        empty_directory 'export'
        empty_directory 'templates'
      end

      def copy_files
        say 'Copying files'
        template    'config.yml', 'config.yml'
        copy_file   'Gemfile', 'Gemfile'
        create_file 'outline.txt'
        template    'sample.md', 'chapters/sample.md'
        template    'layout.xhtml', 'templates/layout.xhtml'
        gsub_file   'templates/layout.xhtml', '<!-- insert @body -->', '<%= @body %>'
        copy_file   'book.css', 'export/book.css'
      end

      def bundle_gems
        inside destination_root do
          say 'Bundling gems'
          run 'bundle install', capture: true
        end
      end

      private

      def self.source_root
        File.join(File.dirname(__FILE__), '..', 'templates')
      end

      def creator
        creator = `finger $USER 2> /dev/null | grep Login | colrm 1 46 2> /dev/null`.chomp
        !creator.empty? ? creator : 'John Doe'
      end
    end
  end
end