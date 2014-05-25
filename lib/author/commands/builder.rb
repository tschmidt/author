require 'thor'

module Author
  module Commands
    class Builder < Thor
      
      desc "xhtml", "Build the XHTML site"
      def xhtml
        say "Building the XHTML site"
        Author::Exporters::XHTML.export
      end
      
    end
  end
end