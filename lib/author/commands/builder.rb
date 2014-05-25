require 'thor'

module Author
  module Commands
    class Builder < Thor
      
      desc "xhtml", "Build the XHTML site"
      def xhtml
        say "Building the XHTML site"
        Author::Exporters::XHTML.export
      end
      
      desc "pdf", "Build PDF from XHTML"
      def pdf
        say "Building the XHTML site"
        Author::Exporters::XHTML.export
        say "Building PDF"
        Author::Exporters::PDF.export
      end
      
    end
  end
end