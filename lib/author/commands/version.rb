require 'thor'

module Author
  module Commands
    class Version < Thor::Group
      
      def version
        say "Author version #{Author::VERSION}"
      end
      
    end
  end
end