require 'thor'

module Author
  module Commands
    class Generator < Thor::Group
      include Thor::Actions
      
      argument :name
      
      def set_destination_root
        self.destination_root = File.join(self.destination_root, name)
      end
      
      def create_project_structure
        say "Creating directories for your new book, #{name}"
        empty_directory "chapters"
        empty_directory "export"
        empty_directory "templates"
      end
      
      def copy_files
        say "Copying files"
        template    'config.yml', 'config.yml'
        copy_file   'Gemfile', 'Gemfile'
        create_file 'outline.txt'
        template    'sample.md', 'chapters/sample.md'
        template    'layout.xhtml', 'templates/layout.xhtml'
        
        gsub_file 'templates/layout.xhtml', '<!-- insert @body -->', '<%= @body %>'
      end
      
      def bundle_gems
        inside destination_root do
          say "Bundling gems"
          run "bundle install", capture: true
        end
      end
      
      private
      
      def self.source_root
        File.join(File.dirname(__FILE__), '..', 'templates')
      end
      
    end
  end
end