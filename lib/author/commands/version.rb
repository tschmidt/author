require 'thor'

module Author
  module Commands
    class Version < Thor
      
      desc "version", "Prints version information for Author"
      def version
        say "Author version #{Author::VERSION}"
      end
      map %w[-v --version] => :version
      
    end
  end
end