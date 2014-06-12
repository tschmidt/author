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
      
      desc "mobi", "Build .mobi format"
      def mobi
        say "Building the XHTML site"
        Author::Exporters::XHTML.export
        say "Building the .mobi file"
        Author::Exporters::Mobi.export
      end
      
      desc "epub", "Build ePub format"
      def epub
        say "Building the XHTML site"
        Author::Exporters::XHTML.export
        say "Building the epub file"
        Author::Exporters::Epub.export
      end
      
      desc "all", "Build everything"
      def all
        say "Building the XHTMl site"
        Author::Exporters::XHTML.export
        say "Building PDF"
        Author::Exporters::PDF.export
        say "Building the .mobi file"
        Author::Exporters::Mobi.export
        say "Building the epub file"
        Author::Exporters::Epub.export
      end
      
    end
  end
end